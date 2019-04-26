#PURPOSE: DEPLOY VM'S BASED ON TEMPLATE FROM .CSV
#CREATED BY: Rob Mokkink rob@mokkinksystems.com

#PARAMETERS FOR THE SCRIPT
Param([string] $CSV = $(throw write-host "NO CSV FILE! [ERROR]" -ForeGroundColor Red)
)



#ADD VMWARE PSSNAPIN
Add-PSSnapin -Name "VMware.VimAutomation.Core"

#FORCE TO LOAD VMWARE POWERSHELL PLUGIN
[Reflection.Assembly]::LoadWithPartialName("vmware.vim")

#ON ERROR CONTINUE
$ErrorActionPreference = "Stop"


#----------------------------------------------------------
#STATIC VARIABLES
#----------------------------------------------------------
$vcserver = "localhost"
$AutoLogon = "True"
$LogOnCount = "1"
$TimeZone = "110"
$Password = "<fill in>"			#ADMIN PASSWORD IN PLAIN TEXT
$OrgName = "<your organization>"
$FullName = "<full name of company>"
$ProdCode = "<product key>"
$PostInstall = "<your post install, leave blank if not used>"
$TimeOut = "1800"			#TIMEOUT BETWEEN DEPLOYMENT
$STARTLINE = 1
$SleepShutdown = "30"		#TIMEOUT FOR SHUTDOWN VM
$SleepRemove = "30"			#TIMEOUT FOR REMOVE VM




#----------------------------------------------------------
#LOGFILE VARIABLES
#----------------------------------------------------------

$date = get-date
$yr = $date.Year.ToString()
$mo = $date.Month.ToString()
$dy = $date.Day.ToString()

$logfile = $yr + "-" + $mo + "-" + $dy + ".log"


#----------------------------------------------------------
#FUNCTION CREATE_LOG
#----------------------------------------------------------
Function CREATE_LOG
{
#TEST IF THE OLD FILE EXISTS
Test-Path $logfile
	if (! $?)
		#THE FILE DOES NOT EXIST, SO WE CREATE A NEW LOGFILE
		{new-item $logfile -type file}
		
			if (! $?)
				{write-ouput "FAILED TO CREATE LOGFILE"
				Exit}
}

#----------------------------------------------------------
#FUNCTION WRITE_LOG
#----------------------------------------------------------
Function WRITE_LOG
{
Param([string]$MESSAGE)


$logdate = get-date
$logyr = $logdate.Year.ToString()
$logmo = $logdate.Month.ToString()
$logdy = $logdate.Day.ToString()
$loghr = $logdate.Hour.ToString()
$logmi = $logdate.Minute.ToString()
$logsc = $logdate.Second.ToString()

$logstamp = $logyr + "-" + $logmo + "-" + $logdy + " " + $loghr + ":" + $logmi + ":" + $logsc + "`t" + $MESSAGE

write-output $logstamp | Out-File $logfile -append

}


#----------------------------------------------------------
#FUNCTION CREATEVM
#----------------------------------------------------------
Function CREATEVM {
			
#connect to VirtualCenter with credentials
connect-viserver -server $vcserver 
			
			
#VIRTUAL MACHINE DATASTORE AND CLUSTER LOCATION SPECIFICATION
			
$vmrSpec = New-Object VMware.Vim.VirtualMachineRelocateSpec 
			
			
#DATASTORE
$LUN = get-datastore $datastore
$LUNview = get-view $LUN.id
$vmrSpec.datastore = $LUNview.moref

		
#RESOURCE POOL
if ($CLUSPOOL -eq $True)
	{
	$cluster = Get-View (get-cluster $vmcluster).id
	$vmrSpec.pool = $cluster.resourcepool
	}
elseif ($HOSTPOOL -eq $True)
	{	
	$pool = get-view -ViewType ComputeResource | where { $_.Name -eq $vmesxhost }
	$vmrSpec.pool = $pool.Resourcepool		
	}
else	
	{		
	$pool = get-resourcepool $vmpool
	$poolview = get-view $pool.id
	$vmrSpec.pool = $poolview.moref
	}


		
			
#CLONE SPECIFICATIONS
			
			$vmcSpec = New-Object VMware.Vim.VirtualMachineCloneSpec
			$vmcSpec.Customization = New-Object VMware.Vim.CustomizationSpec
			
			#DATASTORE SPECIFICATION
			$vmcSpec.location = $vmrSpec
			
			#TURN VM ON AFTER CLONING
			$vmcSpec.powerOn = $true
			
			#VIRTUAL MACHINE IS NOT A TEMPLATE
			$vmcSpec.template = $false
			
			
#NETWORK CONFIGURATION CLONE SPECIFICATIONS
			
			#CREATE OBJECT CUSTOMIZATIONADAPTERMAPPING
			$vmcSpec.Customization.NicSettingMap = @(New-Object VMware.Vim.CustomizationAdapterMapping)
			
			#CREATE OBJECT CUSTOMIZATIONIPSETTINGS
			$vmcSpec.Customization.NicSettingMap[0].Adapter = New-Object VMware.Vim.CustomizationIPSettings
			
			#CREATE OBJECT CUSTOMIZATIONFIXEDIP
			$vmcSpec.Customization.NicSettingMap[0].Adapter.Ip = New-Object VMware.Vim.CustomizationFixedIp
			
			#NETWORK SPECIFICATIONS
			$vmcSpec.Customization.NicSettingMap[0].Adapter.Ip.IpAddress = $ip
			$vmcSpec.Customization.NicSettingMap[0].Adapter.SubnetMask = $subnetmask
			$vmcSpec.Customization.NicSettingMap[0].Adapter.Gateway = $gateway
			$vmcSpec.Customization.NicSettingMap[0].Adapter.DnsServerList = $dns
			
			#CREATE OBJECT CUSTOMIZATIONGLOBALIPSETTINGS
			$vmcSpec.Customization.GlobalIPSettings = New-Object VMware.Vim.CustomizationGlobalIPSettings
			
			
#SYSPREP CLONE SPECIFICATIONS
			
			#CREATE OBJECT CUSTOMIZATIONSYSPREP
			$vmcSpec.Customization.Identity = New-Object VMware.Vim.CustomizationSysprep
			
			#CREATE OBJECT CUSTOMIZATIONGUIUNATTENDED
			$vmcSpec.Customization.Identity.GuiUnattended = New-Object VMware.Vim.CustomizationGuiUnattended
			
			#GUIUNATTENDED SPECIFICATION
			$vmcSpec.Customization.Identity.GuiUnattended.autoLogon = $AutoLogon
			$vmcSpec.Customization.Identity.GuiUnattended.autoLogonCount = $LogOnCount
			$vmcSpec.Customization.Identity.GuiUnattended.timeZone = $TimeZone
			$vmcSpec.Customization.Identity.GuiUnattended.Password = New-Object VMware.Vim.CustomizationPassword
			$vmcSpec.Customization.Identity.GuiUnattended.Password.plainText = "True"
			$vmcSpec.Customization.Identity.GuiUnattended.Password.value = $Password
			
			#CREATE OBJECT CUSTOMIZATIONIDENTIFICATION
			$vmcSpec.Customization.Identity.Identification = New-Object VMware.Vim.CustomizationIdentification
			
			#CUSTOMIZATIONIDENTIFICATION SPECIFICATION
			$vmcSpec.Customization.Identity.Identification.joinWorkgroup = "WORKGROUP"
			
			#CREATE OBJECT CUSTOMIZATIONGUIRUNONCE
			$vmcSpec.Customization.Identity.guiRunOnce = New-Object VMware.Vim.CustomizationGuiRunOnce
			
			#GUIRUNONCE SPECIFICATION
			$vmcSpec.Customization.Identity.guiRunOnce.commandList = $RunOnce
			
			
			#CREATE CUSTOMIZATIONUSERDATA
			$vmcSpec.Customization.Identity.UserData = New-Object VMware.Vim.CustomizationUserData
			
			#CUSTOMIZATIONUSERDATA SPECIFICATION
			$vmcSpec.Customization.Identity.UserData.orgName = $OrgName
			$vmcSpec.Customization.Identity.UserData.fullName = $FullName
			$vmcSpec.Customization.Identity.UserData.productId = $ProdCode
			$vmcSpec.Customization.Identity.UserData.ComputerName = New-Object VMware.Vim.CustomizationFixedName
			$vmcSpec.Customization.Identity.UserData.ComputerName.name = $vmname
			
			
			#CREATE OBJECT CUSTOMIZATIONLICENSEFILEPRINTDATA
			$vmcSpec.Customization.Identity.LicenseFilePrintData = New-Object VMware.Vim.CustomizationLicenseFilePrintData
			
			#CUSTOMIZATIONLICENSEFILEPRINTDATA SPECIFICATION
			$vmcSpec.Customization.Identity.LicenseFilePrintData.AutoMode = New-Object VMware.Vim.CustomizationLicenseDataMode
			$vmcSpec.Customization.Identity.LicenseFilePrintData.AutoMode = "perSeat"
			
			
#WIN OPTIONS CLONE SPECIFICATIONS
			
			#CREATE OBJECT CUSTOMIZATIONWINOPTIONS
			$vmcSpec.Customization.Options = New-Object  VMware.Vim.CustomizationWinOptions
			
			#CHANGE SID
			$vmcSpec.Customization.Options.changeSID = 1
			
			
#CLONE TASK

			#GET VM FOLDER
			$target = Get-Folder $vmfolder
			$targetview = get-view $target.ID
			
			#GET TEMPLATE
			$vmmor = Get-Template -Name $vmtemplate 
			$vmmorview = get-view $vmmor.id
			
			#CLONE TASK
			$task = $vmmorview.CloneVM_Task($targetview.MoRef,$vmname, $vmcSpec )

			
						
			WRITE_LOG "Finished"
			
#TIMEOUT BETWEEN JOBS
			sleep $Timeout
}

#----------------------------------------------------------
#FUNCTION CHECKEXIST_VM
#----------------------------------------------------------
Function CHECKEXIST_VM
{
Param([string]$VM)

$ARRVM = get-vm | where { $_.Name -eq $VM }

#CHECK IF THE THE ARRAY IS FILLED 
				
	if ($ARRVM -eq $null) { 
	return $False }
	else { return $True }
	
	write-output
}

#----------------------------------------------------------
#FUNCTION SHUTDOWN_VM
#----------------------------------------------------------
Function SHUTDOWN_VM
{
Param([string]$VM)

#SHUTDOWN THE GUEST
get-vm | where { $_.Name -eq $VM } | Stop-VM -Confirm:$False

#WAIT FOR THE VM TO SHUTDOWN 
sleep $SleepShutdown

#ERROR HANDLING
	if (! $?)
	{ return $False }
	else
	{return $True }

}

#----------------------------------------------------------
#FUNCTION REMOVE_VM
#----------------------------------------------------------
Function REMOVE_VM
{
Param([string]$VM)

#SHUTDOWN THE GUEST
get-vm | where { $_.Name -eq $VM } | Remove-VM -DeleteFromDisk -Confirm:$False

#WAIT FOR THE VM TO BE REMOVED 
sleep $SleepRemove

#ERROR HANDLING
	if (! $?)
	{ return $False }
	else
	{return $True }

}


#----------------------------------------------------------
#FUNCTION CHECK_DATASTORE
#----------------------------------------------------------
Function CHECK_DATASTORE
{
Param([string]$STORE)

$ARRSTORE = get-datastore | where { $_.Name -eq $STORE }

if ($ARRSTORE -eq $null)
	{return $False}
else
	{return $True}
}	

#----------------------------------------------------------
#FUNCTION CHECK_CLUSTER
#----------------------------------------------------------
Function CHECK_CLUSTER
{
Param([string]$GETCLUSTER)

$ARRCLUSTER = get-cluster | where { $_.Name -eq $GETCLUSTER }

if ($ARRCLUSTER -eq $null)
	{return $False}
else
	{return $True}
}


#----------------------------------------------------------
#FUNCTION CHECK_POOL
#----------------------------------------------------------
Function CHECK_POOL
{
Param([string]$GETPOOL)

$ARRPOOL = get-resourcepool | where { $_.Name -eq $GETPOOL }


if ($ARRPOOL -eq $null)
	{return $False}
else
	{return $True}
}

#----------------------------------------------------------
#FUNCTION CHECK_FOLDER
#----------------------------------------------------------
Function CHECK_FOLDER
{
Param([string]$GETFOLDER)

$ARRFOLDER = get-folder | where { $_.Name -eq $GETFOLDER}

if ($ARRFOLDER -eq $null)
	{return $False}
else
	{return $True}
}


#----------------------------------------------------------
#FUNCTION CHECK_TEMPLATE
#----------------------------------------------------------
Function CHECK_TEMPLATE
{
Param([string]$GETTEMPLATE)

$ARRTEMPLATE = get-template | where { $_.Name -eq $GETTEMPLATE}

if ($ARRTEMPLATE -eq $null)
	{return $False}
else
	{return $True}
}

#----------------------------------------------------------
#FUNCTION CHECK_HOST
#----------------------------------------------------------
Function CHECK_HOST
{
Param([string]$GETHOST)

$ARRHOST = get-vmhost | where { $_.Name -eq $GETHOST}

if ($ARRHOST -eq $null)
	{return $False}
else
	{return $True}
}




#----------------------------------------------------------
#MAIN SCRIPT SECTION
#----------------------------------------------------------
WRITE_LOG "START CREATING VM'S"

#READ THE FILE
$INFILE = (get-content $CSV)

#DETERMINE THE AMOUNT OF LINES
$ENDLINE = $INFILE.Length


#GET THE CONTENT FROM STARTLINE TILL THE END
$ARRFILE = $INFILE[$STARTLINE .. $ENDLINE]


foreach ($VM in $ARRFILE)
{	

	#SPLIT THE LINE
	$STRLINE = $VM.split(';')
		
	#ASSIGN VALUES TO VARIABLES

	#ASSIGN VALUES TO STRINGS
	$vmname = $STRLINE[0]
	#CONVERT $VMNAME TO UPPERCASE
	$vmname = $vmname.ToUpper()
	$datastore = $STRLINE[1]
	$ip = $STRLINE[2]
	$subnetmask = $STRLINE[3]
	$gateway = $STRLINE[4]
	$dns = $STRLINE[5]
	$vmcluster = $STRLINE[6]
	$vmesxhost = $STRLINE[7]
	$vmpool = $STRLINE[8]
	$vmfolder = $STRLINE[9]
	$vmtemplate = $STRLINE[10]
	$vmremove = $STRLINE[11]


#CHECK IF THE VALUES ARE CORRECT AND THE OBJECTS IN VI
$ERRCOUNTERVI = 0

#CONNECT TO VIRTUALCENTER WITH CREDENTIALS
connect-viserver -server $vcserver

#CHECK IF NAME IS SPECIFIED
if ($vmname -eq "")
	{
	WRITE_LOG "VIRTUAL MACHINE NAME MISSING"
	$ERRCOUNTERVI = $ERRCOUNTERVI + 1
	}

#CHECK IF IP IS SPECIFIED	
if ($ip -eq "")
	{
	WRITE_LOG "VIRTUAL MACHINE IP MISSING"
	$ERRCOUNTERVI = $ERRCOUNTERVI + 1
	}

#CHECK IF SUBNET IS SPECIFIED	
if ($subnetmask -eq "")
	{
	WRITE_LOG "VIRTUAL MACHINE SUBNETMASK MISSING"
	$ERRCOUNTERVI = $ERRCOUNTERVI + 1
	}	
		
#CHECK IF GATEWAY IS SPECIFIED	
if ($gateway -eq "")
	{
	WRITE_LOG "VIRTUAL MACHINE GATEWAY MISSING"
	$ERRCOUNTERVI = $ERRCOUNTERVI + 1
	}

#CHECK IF DNS IS SPECIFIED	
if ($dns -eq "")
	{
	WRITE_LOG "VIRTUAL MACHINE DNS MISSING"
	$ERRCOUNTERVI = $ERRCOUNTERVI + 1
	}	
	
		

#CHECK THE DATASTORE
if ( $datastore -eq "")
	{
	WRITE_LOG "DATASTORE MISSING"
	}
	
else	
	{
		$CHECKSTORE = CHECK_DATASTORE $datastore
			if ($CHECKSTORE -eq $True) 
				{WRITE_LOG "DATASTORE: $datastore EXISTS"}
				
			else	
				{WRITE_LOG "DATASTORE: $datastore DOES NOT EXIST"
				$ERRCOUNTERVI = $ERRCOUNTERVI + 1}			
	}
		
#CHECK THE CLUSTER, ESXHOST AND RESOURCEPOOL TOGETHER, BECAUSE OF THE OVERLAP EACH OTHER, RESOURCEPOOL VALUE IS LEADING				

#SET CLUSPOOL AND HOSTPOOL TO FALSE, SO THEY ARE EMPTY WHEN THE CHECK STARTS
$CLUSPOOL = $False
$HOSTPOOL = $False

#CHECK THE RESOURCEPOOL
if ( $vmpool -eq "")
	{
	WRITE_LOG "RESOURCEPOOL MISSING"
	
		#CHECK IF CLUSTER VALUE EXISTS
		if ($vmcluster -eq "")
			{
			write-ouput "CLUSTER MISSING"
			
			
				#CHECK IF ESXHOST VALUE EXISTS
				if ($vmesxhost -eq "")
					{
					WRITE_LOG "ESX HOST MISSING"
					$ERRCOUNTERVI = $ERRCOUNTERVI + 1
					}
				else
					{
					#CHECK THE ESXHOST
					 $CHECKESXHOST = CHECK_HOST $vmesxhost
					
					if ($CHECKESXHOST -eq $True) 
						{
						WRITE_LOG "ESXHOST: $vmesxhost EXISTS"
						WRITE_LOG "ESXHOST DEFAULT RESOURCEPOOL WILL BE USED"
						$HOSTPOOL = $True
						}	
							
					else
						{
						WRITE_LOG "ESXHOST: $vmesxhost DOES NOT EXIST"
						$ERRCOUNTERVI = $ERRCOUNTERVI + 1
						}
					}		
			}		
			
		else
			{
			#CHECK THE CLUSTER
			$CHECKCLUSTER = CHECK_CLUSTER $vmcluster
					
			if ($CHECKCLUSTER -eq $True) 
				{
				WRITE_LOG "CLUSTER: $vmcluster EXISTS"
				WRITE_LOG "CLUSTER DEFAULT RESOURCEPOOL WILL BE USED"
				$CLUSPOOL = $True
				}	
					
			else
				{
				WRITE_LOG "CLUSTER: $vmcluster DOES NOT EXIST"
				$ERRCOUNTERVI = $ERRCOUNTERVI + 1
				}	
			}
	}

else
	{
	#CHECK THE RESOURCEPOOL				
	$CHECKPOOL = CHECK_POOL $vmpool
	
	if ($CHECKPOOL -eq $True) 
		{WRITE_LOG "RESOURCEPOOL: $vmpool EXISTS"}
	
		
	else
		{WRITE_LOG "RESOURCEPOOL: $vmpool DOES NOT EXIST"
			
			#CHECK IF CLUSTER VALUE EXISTS
			if ($vmcluster -eq "")
				{
				WRITE_LOG "CLUSTER MISSING"
							
					#CHECK IF ESXHOST VALUE EXISTS
					if ($vmesxhost -eq "")
						{
						WRITE_LOG "ESX HOST MISSING"
						$ERRCOUNTERVI = $ERRCOUNTERVI + 1
						}
					else
						{
							#CHECK THE ESXHOST
							 $CHECKESXHOST = CHECK_HOST $vmesxhost
										
							if ($CHECKESXHOST -eq $True) 
								{
								WRITE_LOG "ESXHOST: $vmesxhost BESTAAT"
								WRITE_LOG "ESXHOST DEFAULT RESOURCEPOOL WILL BE USED"
								$HOSTPOOL = $True
								}	
												
							else
								{
								WRITE_LOG "ESXHOST: $vmesxhost DOES NOT EXIST"
								$ERRCOUNTERVI = $ERRCOUNTERVI + 1
								}
						  }	
							
					}					
				else
						{
						#CHECK THE CLUSTER
						$CHECKCLUSTER = CHECK_CLUSTER $vmcluster
								
						if ($CHECKCLUSTER -eq $True) 
							{
							WRITE_LOG "CLUSTER: $vmcluster EXISTS"
							WRITE_LOG "CLUSTER DEFAULT RESOURCEPOOL WILL BE USED"
							$CLUSPOOL = $True
							}	
								
						else
							{
							WRITE_LOG "CLUSTER: $vmcluster DOES NOT EXIST"
							$ERRCOUNTERVI = $ERRCOUNTERVI + 1
							}	
						 }
			}			 
		
	}

		
		
			
#CHECK THE FOLDER
$CHECKFOLDER = CHECK_FOLDER $vmfolder
	if ($CHECKFOLDER -eq $True) 
		{WRITE_LOG "FOLDER: $vmfolder EXISTS"}
		
	else	
		{
		WRITE_LOG "FOLDER: $vmfolder DOES NOT EXIST"
		WRITE_LOG "THE DEFAULT FOLDER WILL BE USED"
		$vmfolder = "vm"
		}	
 
		
#CHECK THE TEMPLATE
$CHECKTEMPLATE = CHECK_TEMPLATE $vmtemplate
	if ($CHECKTEMPLATE -eq $True) 
		{
		WRITE_LOG "TEMPLATE: $vmtemplate EXISTS"
		}

	else	
		{
		WRITE_LOG "TEMPLATE: $vmtemplate DOES NOT EXIST"
		$ERRCOUNTERVI = $ERRCOUNTERVI + 1
		}					
		
#GUIRUNONCE SETTINGS
#YOU CAN ADD ADDIONATIONAL PARAMETERS
$RunOnce = $PostInstall


		
#IF VALUES ARE CORRECT AND OBJECTS EXIST CREATE THE VM
if 	($ERRCOUNTERVI -eq 0)
{
	
#CHECK IF THE VM EXISTS
#CONNECT TO VIRTUALCENTER WITH CREDENTIALS
connect-viserver -server $vcserver 
								
	#USE FUNCTION CHECKEXIST_VM
	$CHECKVM = CHECKEXIST_VM $vmname
									
									
									
	#HANDLING OF VM EXISTENS
	if ($CHECKVM -eq $False )
		{
		WRITE_LOG "VIRTUAL MACHINE DOES NOT EXIST" 
		WRITE_LOG "VIRTUELE MACHINE: $vmname WILL BE DEPLOYED"
											
		#CALL FUNCTION CREATEVM
		CREATEVM
		}
										
	else
		{ 
	 	 WRITE_LOG "VIRTUAL MACHINE ALREADY EXISTS"
											
		#CHECK IF THE VM IS MARKED TO BE REMOVED USE SWITCH
			$vmremove = $vmremove.ToLower()
			switch ($vmremove)
			{
			yes {WRITE_LOG "VIRTUAL MACHINE IS MARKED TO BE REMOVED"
				 $REMOVEVM = $True}
			no {WRITE_LOG "VIRTUAL MACHINE CANNOT BE REMOVED"
				$REMOVEVM = $False}
			default {WRITE_LOG "VIRTUAL MACHINE CANNOT BE REMOVED"
					$REMOVEVM = $False}
			}
										
											
				#CHECK IF WE MUST REMOVE THE VIRTUAL MACHINE
				if ($REMOVEVM -eq $True)
					{
					WRITE_LOG "SHUTDOWN VM: $vmname"
												
					#CALL FUNCTION SHUTDOWN_VM
					$CHECKSHUTDOWN = SHUTDOWN_VM $vmname
													
						#ERRORHANDLING
						if ($CHECKSHUTDOWN -eq $False)
							{WRITE_LOG "FAILED TO SHUTDOWN VIRTUALMACHINE: $vmname"
							Break}
														
						else
							{WRITE_LOG "REMOVE VIRTUAL MACHINE: $vmname"
														
							#CALL THE FUNCTION REMOVE_VM
							$CHECKREMOVE = REMOVE_VM $vmname
														
								#ERRORHANDLING
								if ($CHECKREMOVE -eq $False)
									{WRITE_LOG "FAILED TO REMOVE VIRTUALMACHINE: $vmname"
									Break}
																						
								else
									{WRITE_LOG "REDEPLOY VIRTUAL MACHINE: $vmname"
															
									#CALL FUNCTION CREATEVM
									CREATEVM
									}
										
								}								
					}
		}		

	 }
			
#END LOOP THROUGH CSV FILE
}			