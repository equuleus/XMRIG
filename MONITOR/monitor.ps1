Set-ExecutionPolicy Unrestricted -Scope CurrentUser -Force
Clear-Host

$objSettings					= @{}
$objSettings["DEFAULT"]				= @{}
$objSettings["DEFAULT"]["PORT"]			= @{}
$objSettings["DEFAULT"]["PORT"]["XMRIG-CPU"]	= 9991
$objSettings["DEFAULT"]["PORT"]["XMRIG-NVIDIA"]	= 9992
$objSettings["DEFAULT"]["PORT"]["XMRIG-AMD"]	= 9993
$objSettings["DEFAULT"]["PORT"]["TRM"]		= 4028
$objSettings["SYSTEM"]				= @{}
$objSettings["SYSTEM"]["ComputerName"]		= [System.Environment]::MachineName
#$objSettings["SYSTEM"]["ComputerName"]	= $env:COMPUTERNAME
#$objSettings["SYSTEM"]["ComputerName"]	= [System.Net.DNS]::GetHostByName("localhost").HostName
$objSettings["SCRIPT"]				= @{}
$objSettings["SCRIPT"]["TIME"]			= @{}
$objSettings["SCRIPT"]["TIME"]["Refresh"]	= 30
$objSettings["SCRIPT"]["TIME"]["NotificationFrequency"]	= (60 * 30)
$objSettings["SCRIPT"]["OTHER"]			= @{}
$objSettings["SCRIPT"]["OTHER"]["ConfirmationAttempts"]	= 3
$objSettings["SCRIPT"]["OTHER"]["TemperatureAdjustment"]= 3

$objComputers					= @{}
$objComputers["COMPUTER-0"]			= @{}
$objComputers["COMPUTER-1"]			= @{}
$objComputers["COMPUTER-2"]			= @{}
$objComputers["COMPUTER-3"]			= @{}
$objComputers["COMPUTER-4"]			= @{}
$objComputers["COMPUTER-0"]["XMRIG-PROXY"]	= @{}
#$objComputers["COMPUTER-0"]["XMRIG-PROXY"]["COMPUTER-1"] = @("TRM")
#$objComputers["COMPUTER-0"]["XMRIG-PROXY"]["COMPUTER-2"] = @("TRM")
#$objComputers["COMPUTER-0"]["XMRIG-PROXY"]["COMPUTER-3"] = @("TRM")
#$objComputers["COMPUTER-0"]["XMRIG-PROXY"]["COMPUTER-4"] = @("TRM")
$objComputers["COMPUTER-0"]["XMRIG-PROXY"]["COMPUTER-1"] = @("XMRIG-CPU","TRM")
$objComputers["COMPUTER-0"]["XMRIG-PROXY"]["COMPUTER-2"] = @("XMRIG-CPU","TRM")
$objComputers["COMPUTER-0"]["XMRIG-PROXY"]["COMPUTER-3"] = @("XMRIG-CPU","TRM")
$objComputers["COMPUTER-0"]["XMRIG-PROXY"]["COMPUTER-4"] = @("XMRIG-CPU","TRM")
$objComputers["COMPUTER-1"]["XMRIG-CPU"]	= "192.168.0.101:9991:COMPUTER-1"
$objComputers["COMPUTER-2"]["XMRIG-CPU"]	= "192.168.0.102:9991:COMPUTER-2"
$objComputers["COMPUTER-3"]["XMRIG-CPU"]	= "192.168.0.103:9991:COMPUTER-3"
$objComputers["COMPUTER-4"]["XMRIG-CPU"]	= "192.168.0.104:9991:COMPUTER-4"
#$objComputers["COMPUTER-1"]["XMRIG-AMD"]	= "192.168.0.101:9993:COMPUTER-1"
#$objComputers["COMPUTER-2"]["XMRIG-AMD"]	= "192.168.0.102:9993:COMPUTER-2"
#$objComputers["COMPUTER-3"]["XMRIG-AMD"]	= "192.168.0.103:9993:COMPUTER-3"
#$objComputers["COMPUTER-4"]["XMRIG-AMD"]	= "192.168.0.104:9993:COMPUTER-4"
$objComputers["COMPUTER-1"]["TRM"]		= "192.168.0.101:4028"
$objComputers["COMPUTER-2"]["TRM"]		= "192.168.0.102:4028"
$objComputers["COMPUTER-3"]["TRM"]		= "192.168.0.103:4028"
$objComputers["COMPUTER-4"]["TRM"]		= "192.168.0.104:4028"

$objHashrate					= @{}
$objHashrate["COMPUTER-1"]			= @{}
$objHashrate["COMPUTER-1"]["XMRIG-CPU"]		= @{}
$objHashrate["COMPUTER-1"]["XMRIG-CPU"]["TOTAL"]= 300
$objHashrate["COMPUTER-1"]["TRM"]		= @{}
$objHashrate["COMPUTER-1"]["TRM"]["TOTAL"] 	= 4000
$objHashrate["COMPUTER-1"]["TRM"]["GPU-0"] 	= 2000
$objHashrate["COMPUTER-1"]["TRM"]["GPU-1"] 	= 2000
$objHashrate["COMPUTER-2"]			= @{}
$objHashrate["COMPUTER-2"]["XMRIG-CPU"]		= @{}
$objHashrate["COMPUTER-2"]["XMRIG-CPU"]["TOTAL"]= 250
$objHashrate["COMPUTER-2"]["TRM"]		= @{}
$objHashrate["COMPUTER-2"]["TRM"]["TOTAL"] 	= 4000
$objHashrate["COMPUTER-2"]["TRM"]["GPU-0"] 	= 2000
$objHashrate["COMPUTER-2"]["TRM"]["GPU-1"] 	= 2000
$objHashrate["COMPUTER-3"]			= @{}
$objHashrate["COMPUTER-3"]["XMRIG-CPU"]		= @{}
$objHashrate["COMPUTER-3"]["XMRIG-CPU"]["TOTAL"]= 20
$objHashrate["COMPUTER-3"]["TRM"]		= @{}
$objHashrate["COMPUTER-3"]["TRM"]["TOTAL"] 	= 10000
$objHashrate["COMPUTER-3"]["TRM"]["GPU-0"] 	= 2000
$objHashrate["COMPUTER-3"]["TRM"]["GPU-1"] 	= 2000
$objHashrate["COMPUTER-3"]["TRM"]["GPU-2"] 	= 2000
$objHashrate["COMPUTER-3"]["TRM"]["GPU-3"] 	= 2000
$objHashrate["COMPUTER-3"]["TRM"]["GPU-4"] 	= 2000
$objHashrate["COMPUTER-4"]			= @{}
$objHashrate["COMPUTER-4"]["XMRIG-CPU"]		= @{}
$objHashrate["COMPUTER-4"]["XMRIG-CPU"]["TOTAL"]= 20
$objHashrate["COMPUTER-4"]["TRM"]		= @{}
$objHashrate["COMPUTER-4"]["TRM"]["TOTAL"] 	= 10000
$objHashrate["COMPUTER-4"]["TRM"]["GPU-0"] 	= 2000
$objHashrate["COMPUTER-4"]["TRM"]["GPU-1"] 	= 2000
$objHashrate["COMPUTER-4"]["TRM"]["GPU-2"] 	= 2000
$objHashrate["COMPUTER-4"]["TRM"]["GPU-3"] 	= 2000
$objHashrate["COMPUTER-4"]["TRM"]["GPU-4"] 	= 2000

$objTemperature					= @{}
$objTemperature["COMPUTER-1"]			= @{}
$objTemperature["COMPUTER-1"]["TRM"]		= @{}
$objTemperature["COMPUTER-1"]["TRM"]["GPU-0"] 	= 45
$objTemperature["COMPUTER-1"]["TRM"]["GPU-1"] 	= 44
$objTemperature["COMPUTER-2"]			= @{}
$objTemperature["COMPUTER-2"]["TRM"]		= @{}
$objTemperature["COMPUTER-2"]["TRM"]["GPU-0"] 	= 44
$objTemperature["COMPUTER-2"]["TRM"]["GPU-1"] 	= 42
$objTemperature["COMPUTER-3"]			= @{}
$objTemperature["COMPUTER-3"]["TRM"]		= @{}
$objTemperature["COMPUTER-3"]["TRM"]["GPU-0"] 	= 44
$objTemperature["COMPUTER-3"]["TRM"]["GPU-1"] 	= 52
$objTemperature["COMPUTER-3"]["TRM"]["GPU-2"] 	= 54
$objTemperature["COMPUTER-3"]["TRM"]["GPU-3"] 	= 44
$objTemperature["COMPUTER-3"]["TRM"]["GPU-4"] 	= 57
$objTemperature["COMPUTER-4"]			= @{}
$objTemperature["COMPUTER-4"]["TRM"]		= @{}
$objTemperature["COMPUTER-4"]["TRM"]["GPU-0"] 	= 34
$objTemperature["COMPUTER-4"]["TRM"]["GPU-1"] 	= 58
$objTemperature["COMPUTER-4"]["TRM"]["GPU-2"] 	= 53
$objTemperature["COMPUTER-4"]["TRM"]["GPU-3"] 	= 45
$objTemperature["COMPUTER-4"]["TRM"]["GPU-4"] 	= 47

$objEmail					= @{}
$objEmail["ServerUsername"]			= @{}
$objEmail["ServerPassword"]			= @{}
$objEmail["ServerUsername"]["XMRIG-CPU"]	= "xmrig-cpu@mail.com"
$objEmail["ServerPassword"]["XMRIG-CPU"]	= "xmrig-cpu-password"
$objEmail["ServerUsername"]["XMRIG-NVIDIA"]	= "xmrig-nvidia@mail.com"
$objEmail["ServerPassword"]["XMRIG-NVIDIA"]	= "xmrig-nvidia-password"
$objEmail["ServerUsername"]["XMRIG-AMD"]	= "xmrig-amd@mail.com"
$objEmail["ServerPassword"]["XMRIG-AMD"]	= "xmrig-amd-password"
$objEmail["ServerUsername"]["TRM"]		= "trm@mail.com"
$objEmail["ServerPassword"]["TRM"]		= "trm-password"
$objEmail["ServerAddress"]			= "smtp.mail.com"
$objEmail["ServerPort"]				= "25"
#$objEmail["ServerUsername"]			= "anonymous"
#$objEmail["ServerPassword"]			= ConvertTo-SecureString "anonymous" -AsPlainText -Force
$objEmail["From"]				= @{}
$objEmail["From"]["XMRIG-CPU"]			= "XMRig CPU <" + $objEmail.("ServerUsername").("XMRIG-CPU") + ">"
$objEmail["From"]["XMRIG-NVIDIA"]		= "XMRig NVIDIA <" + $objEmail.("ServerUsername").("XMRIG-NVIDIA") + ">"
$objEmail["From"]["XMRIG-AMD"]			= "XMRig AMD <" + $objEmail.("ServerUsername").("XMRIG-AMD") + ">"
$objEmail["From"]["TRM"]			= "Team Red Miner <" + $objEmail.("ServerUsername").("TRM") + ">"
$objEmail["To"]					= @("Administrator <" + "admin@mail.com" + ">")
$objEmail["Subject"]				= @{}
$objEmail["Subject"]["XMRIG-CPU"]		= "XMRig CPU: attention required"
$objEmail["Subject"]["XMRIG-NVIDIA"]		= "XMRig NVIDIA: attention required"
$objEmail["Subject"]["XMRIG-AMD"]		= "XMRig AMD: attention required"
$objEmail["Subject"]["TRM"]			= "Team Red Miner: attention required"
$objEmail["Body"]				= ""
#$objEmail["Encoding"]				= "Unicode"	# ASCII, UTF8, UTF7, UTF32, Unicode, BigEndianUnicode, Default, OEM
$objEmail["AttachmentPath"]			= Split-Path -Parent (((Get-Variable MyInvocation -Scope Script).Value).MyCommand.Path)
$objEmail["AttachmentFile"]			= ""
If ((($objEmail.("AttachmentPath") -ne "") -and ($objEmail.("AttachmentFile") -ne "")) -and (Test-Path -Path ($objEmail.("AttachmentPath") + "\" + $objEmail.("AttachmentFile")))) {
	$objEmail["Attachment"]			= @($objEmail.("AttachmentPath") + "\" + $objEmail.("AttachmentFile"))
} Else {
	$objEmail["Attachment"]			= @()
}
#$objEmail["Delivery"]				= "Never"	# OnSuccess, OnFailure, Delay, Never
#$objEmail["Priority"]				= "Normal"	# Normal, High, and Low
$objEmail["Credential"]				= @{}
$objEmail["Credential"]["XMRIG-CPU"]		= New-Object System.Net.NetworkCredential($objEmail.("ServerUsername").("XMRIG-CPU"), $objEmail.("ServerPassword").("XMRIG-CPU"))
$objEmail["Credential"]["XMRIG-NVIDIA"]		= New-Object System.Net.NetworkCredential($objEmail.("ServerUsername").("XMRIG-NVIDIA"), $objEmail.("ServerPassword").("XMRIG-NVIDIA"))
$objEmail["Credential"]["XMRIG-AMD"]		= New-Object System.Net.NetworkCredential($objEmail.("ServerUsername").("XMRIG-AMD"), $objEmail.("ServerPassword").("XMRIG-AMD"))
$objEmail["Credential"]["TRM"]			= New-Object System.Net.NetworkCredential($objEmail.("ServerUsername").("TRM"), $objEmail.("ServerPassword").("TRM"))

Function GetAPI {
	Param(
		[string]$strType,
		[string]$strAddress,
		[int]$intPort,
		[string]$strToken,
		[string]$strCommand
	)
	If (($strType -eq "XMRIG-CPU") -or ($strType -eq "XMRIG-NVIDIA") -or ($strType -eq "XMRIG-AMD")) {
		$strURI		= "http://" + $strAddress + ":" + $intPort
		$strMethod	= "GET"
		$objHeaders	= @{
			"Content-type" = "Application/json"
		}
		If ($strToken -ne "") {
			$objHeaders["Authorization"] = ("Bearer " + $strToken)
		}
		$strContentType	= "Application/json"
		Try {
			$objWebRequest = Invoke-WebRequest -Uri $strURI -Method $strMethod -Headers $objHeaders -ContentType $strContentType -TimeoutSec 3
		} Catch {
#			Write-Host ((Get-Time) + " [ERROR] Can not connect to ip address """ + $strAddress + """ on port """ + $intPort + """: " + $_.Exception.Response)
		} Finally {
			If ($objWebRequest -ne $null) {
				$strResult = $objWebRequest.Content
			} Else {
				$strResult = ""
			}
		}
	}
	If ($strType -eq "TRM") {
		Try {
			$objSocket = New-Object System.Net.Sockets.TcpClient
			$objConnect = $objSocket.BeginConnect($strAddress, $intPort, $null, $null)
			Start-Sleep -m 500
			If ($objSocket.Connected) {
				$objStream = $objSocket.GetStream()
				$objWriter = New-Object System.IO.StreamWriter($objStream)
				$objBuffer = New-Object System.Byte[] 1024
				$objEncoding = New-Object System.Text.AsciiEncoding
				$objWriter.WriteLine($strCommand)
				$objWriter.Flush()
				Start-Sleep -m 500
				While ($objStream.DataAvailable) {
					$strRead = $objStream.Read($objBuffer, 0, 1024)
					$strResult = $objEncoding.GetString($objBuffer, 0, $strRead)
				}
				$objWriter.Close()
				$objStream.Close()
			} Else {
#				Write-Host ((Get-Time) + " [ERROR] Can not connect to ip address """ + $strAddress + """ on port """ + $intPort + """.")
				$strResult = ""
			}
		        $objSocket.Close()
		} Catch [System.Net.Sockets.SocketException] {
#			Write-Host ((Get-Time) + " [ERROR] Can not connect to ip address """ + $strAddress + """ on port """ + $intPort + """: " + $_.Exception.Message)
			$strResult = ""
		}
	}
	Return $strResult
}

Function TransformAPI {
	Param(
		[string]$strType,
		[string]$strContent
	)
	If (($strType -eq "XMRIG-CPU") -or ($strType -eq "XMRIG-NVIDIA") -or ($strType -eq "XMRIG-AMD")) {
		$objData = ConvertFrom-Json -InputObject $strContent
	}
	If ($strType -eq "TRM") {
		$objData = [ordered] @{}
		If (($strContent -ne $null) -and ($strContent -ne "")) {
			$objResult = $strContent.Split("|")
			ForEach ($strLine in $objResult) {
				$objContent = $strLine.Split(",")
				ForEach ($strVariable in $objContent) {
					$objTemp = $strVariable.Split("=")
					If ($objTemp[1] -ne $null) {
						$objData[$objTemp[0]] = $objTemp[1]
					} Else {
						$objData[$objTemp[0]] = ""
					}
				}
			}
		}
	}
	Return $objData
}

Function SendEmail {
	Param(
		[string]$strFrom,
		[array]$objTo,
		[string]$strSubject,
		[string]$strBody,
		[array]$objAttachments,
		[string]$strServerAddress,
		[int]$strServerPort,
		[object]$strServerCredential
	)
	Try {
		$strEmailMessage	= New-Object System.Net.Mail.MailMessage
		$strEmailMessage.From	= $strFrom
		ForEach ($strRecipient in $objTo) {
			$strEmailMessage.To.Add($strRecipient)
		}
		$strEmailMessage.Subject= $strSubject
		$strEmailMessage.Body	= $strBody
		If ($objAttachments.Count -gt 0) {
			ForEach ($strAttachment in $objAttachments) {
				$strEmailAttachment = New-Object System.Net.Mail.Attachment ($strAttachment, "text/plain")
				$strEmailMessage.Attachments.Add($strEmailAttachment)
			}
		}
		$objEmail		= New-Object System.Net.Mail.SmtpClient
		$objEmail.Host		= $strServerAddress
		$objEmail.Port		= $strServerPort
		$objEmail.Credentials	= $strServerCredential
		$objEmail.EnableSsl	= $true
#		$objEmail.IsBodyHTML	= $false
#		$objEmail.Priority	= [System.Net.Mail.MailPriority]::High
		$objEmail.Send($strEmailMessage)
		$strEmailMessage.Dispose()
		$strResult = $true
	} Catch {
		Write-Host ((Get-Time) + " [ERROR] Can not send e-mail: " + $_.Exception.Message)
		$strResult = $false
	}
	Return $strResult
}

Function CheckHashTables {
	Param(
		[hashtable]$objNotifications,
		[hashtable]$objConfirmations,
		[string]$strComputer,
		[string]$strType,
		[string]$strItem,
		[string]$strParam
	)
	If ($objNotifications.ContainsKey($strComputer) -eq $false) {
		$objNotifications[$strComputer] = @{}
	}
	If ($objNotifications.($strComputer).ContainsKey($strType) -eq $false) {
		$objNotifications[$strComputer][$strType] = @{}
	}
	If (($strParam -eq $null) -or ($strParam -eq "")) {
		If ($objNotifications.($strComputer).($strType).ContainsKey($strItem) -eq $false) {
			$objNotifications[$strComputer][$strType][$strItem] = 0
		}
	} Else {
		If ($objNotifications.($strComputer).($strType).ContainsKey($strItem) -eq $false) {
			$objNotifications[$strComputer][$strType][$strItem] = @{}
		}
		If ($objNotifications.($strComputer).($strType).($strItem).ContainsKey($strParam) -eq $false) {
			$objNotifications[$strComputer][$strType][$strItem][$strParam] = 0
		}
	}
	If ($objConfirmations.ContainsKey($strComputer) -eq $false) {
		$objConfirmations[$strComputer] = @{}
	}
	If ($objConfirmations.($strComputer).ContainsKey($strType) -eq $false) {
		$objConfirmations[$strComputer][$strType] = @{}
	}
	If (($strParam -eq $null) -or ($strParam -eq "")) {
		If ($objConfirmations.($strComputer).($strType).ContainsKey($strItem) -eq $false) {
			$objConfirmations[$strComputer][$strType][$strItem] = 0
		}
	} Else {
		If ($objConfirmations.($strComputer).($strType).ContainsKey($strItem) -eq $false) {
			$objConfirmations[$strComputer][$strType][$strItem] = @{}
		}
		If ($objConfirmations.($strComputer).($strType).($strItem).ContainsKey($strParam) -eq $false) {
			$objConfirmations[$strComputer][$strType][$strItem][$strParam] = 0
		}
	}
	Return @($objNotifications, $objConfirmations)
}

Function ReportAlert {
	Param(
		[hashtable]$objSettings,
		[hashtable]$objEmail,
		[hashtable]$objNotifications,
		[hashtable]$objConfirmations,
		[hashtable]$objData,
		[string]$strType,
		[string]$strItem,
		[string]$strKey
	)
	$strComputer = $objData.("COMPUTER")
	If ($strItem -eq "CONNECT") {
		$intLastNotification = [int]$objNotifications.($strComputer).($strType).($strItem)
		$intLastConfirmation = [int]$objConfirmations.($strComputer).($strType).($strItem)
	} Else {
		If ($strItem -eq "POOL") {
			$objTemestamp = New-Object -Type DateTime -ArgumentList 1970, 1, 1, 0, 0, 0, 0
		}
		$intLastNotification = [int]$objNotifications.($strComputer).($strType).($strItem).($strKey)
		$intLastConfirmation = [int]$objConfirmations.($strComputer).($strType).($strItem).($strKey)
	}
	If ($strItem -eq "CONNECT") {
		$strText = "Can not get information from ip address """ + $objData.("ADDRESS") + """ on port """ + $objData.("PORT") + """"
	}
	If ($strItem -eq "POOL") {
		If ($strType -eq "TRM") {
			$strText = "Pool (""" + $objData.("URL") + """) has """ + $objData.("STATUS") + """ status (""" + (Get-Date -Date $objTemestamp.AddSeconds($objData.("TIME")).ToLocalTime() -format "HH:mm:ss, yyyy-MM-dd") + """)"
		} Else {
			$strText = "Pool (""" + $objData.("URL") + """) is disconnected"
		}
	}
	If ($strItem -eq "GPU") {
		$strText = "GPU " + $objData.("ID") + " has """ + $objData.("STATUS") + """ status"
	}
	If ($strItem -eq "HASHRATE") {
		If ($strKey -eq "TOTAL") {
			$strText = "Total average hashrate is less (" + $objData.("H-API") + " H/Sec) than expected (" + $objData.("H-Template") + " H/Sec)"
		} Else {
			If ($strType -eq "TRM") {
				$strText = "GPU " + $objData.("ID") + " average hashrate is less (" + $objData.("H-API") + " H/Sec) than expected (" + $objData.("H-Template") + " H/Sec)"
			} Else {
				$strText = "Thread " + $objData.("ID") + " average hashrate is less (" + $objData.("H-API") + " H/Sec) than expected (" + $objData.("H-Template") + " H/Sec)"
			}
		}
	}
	If ($strItem -eq "TEMPERATURE") {
		$strText = "GPU " + $objData.("ID") + " temperature is more (" + $objData.("T-API") + " C) than expected (" + $objData.("T-Template") + " C)"
	}
	If (((Get-Date -UFormat %s -Millisecond 0) - $intLastNotification) -ge $objSettings.("SCRIPT").("TIME").("NotificationFrequency")) {
		If ($intLastConfirmation -lt ($objSettings.("SCRIPT").("OTHER").("ConfirmationAttempts") - 1)) {
			If ($strItem -eq "CONNECT") {
				$objConfirmations[$strComputer][$strType][$strItem] += 1
			} Else {
				$objConfirmations[$strComputer][$strType][$strItem][$strKey] += 1
			}
			Write-Host ((Get-Time) + " """ + $strComputer + """ """ + $strType + """ [WARNING] " + $strText + " [attempt " + ($intLastConfirmation + 1) + " of " + $objSettings.("SCRIPT").("OTHER").("ConfirmationAttempts") + "].")
		} Else {
			Write-Host ((Get-Time) + " """ + $strComputer + """ """ + $strType + """ [ALERT] " + $strText + ".")
			$strEmailBody = "COMPUTER """ + $strComputer + """ [" + $strType + "]: " + $strText + " in " + (Get-Date -format "HH:mm:ss, dd MMMM yyyy") + "."
			$strResult = SendEmail $objEmail.("From").($strType) $objEmail.("To") ($objEmail.("Subject").($strType) + " on """ + $strComputer + """") ($objEmail.("Body") + $strEmailBody) $objEmail.("Attachment") $objEmail.("ServerAddress") $objEmail.("ServerPort") $objEmail.("Credential").($strType)
			If ($strResult -eq $true) {
				If ($strItem -eq "CONNECT") {
					$objNotifications[$strComputer][$strType][$strItem] = Get-Date -UFormat %s -Millisecond 0
					$objConfirmations[$strComputer][$strType][$strItem] = 0
				} Else {
					$objNotifications[$strComputer][$strType][$strItem][$strKey] = Get-Date -UFormat %s -Millisecond 0
					$objConfirmations[$strComputer][$strType][$strItem][$strKey] = 0
				}
				Write-Host ((Get-Time) + " """ + $strComputer  + """ """ + $strType + """ [INFO] Last " + $objSettings.("SCRIPT").("OTHER").("ConfirmationAttempts") + " attempts fails. E-mail report was sent to: """ + $objEmail.("To") + """.")
			} Else {
				Write-Host ((Get-Time) + " """ + $strComputer  + """ """ + $strType + """ [ERROR] Last " + $objSettings.("SCRIPT").("OTHER").("ConfirmationAttempts") + " attempts fails. E-mail report sending error.")
			}
			Remove-Variable -Name strResult
			Remove-Variable -Name strEmailBody
		}
	} Else {
		Write-Host ((Get-Time) + " """ + $strComputer + """ """ + $strType + """ [WARNING] " + $strText + " [waiting " + ($objSettings.("SCRIPT").("TIME").("NotificationFrequency") - ((Get-Date -UFormat %s -Millisecond 0) - $intLastNotification)) + " seconds till next e-mail report].")
	}
	If ($strItem -eq "POOL") {
		Remove-Variable -Name objTemestamp
	}
	Remove-Variable -Name strText
	Remove-Variable -Name intLastConfirmation
	Remove-Variable -Name intLastNotification
	Remove-Variable -Name strComputer
	Return @($objNotifications, $objConfirmations)
}

If ($PSVersionTable.PSVersion.Major -lt 3) {
	Function ConvertFrom-Json([string] $InputObject) {
		[System.Reflection.Assembly]::LoadWithPartialName("System.Web.Extensions") | Out-Null
		Add-Type -AssemblyName System.Web.Extensions
		$objSerialization = New-Object System.Web.Script.Serialization.JavaScriptSerializer
		$OutputObject = New-Object -Type PSObject -Property $objSerialization.DeserializeObject($InputObject)
		Return $OutputObject
	}
}

Function Get-Time {
	Return (Get-Date -format "[yyyy-MM-dd HH-mm-ss]")
}

Function Monitor {
	Param(
		[hashtable]$objSettings,
		[hashtable]$objComputers,
		[hashtable]$objHashrate,
		[hashtable]$objTemperature,
		[hashtable]$objEmail,
		[hashtable]$objNotifications,
		[hashtable]$objConfirmations,
		[int]$intGlobalCounter
	)
	[string]$strIPPattern		= "^([1-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])(\.([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])){3}$"
	$objInfo			= @{}
	$objTotal			= @{}
	$objLocalCounter		= @{}
	$objComputersTemp		= @{}
	ForEach ($strComputerTempName in ($objComputers.Keys | Sort-Object)) {
		If ($objComputers.ContainsKey($objSettings.("SYSTEM").("ComputerName")) -eq $true) {
			If ($strComputerTempName -eq $objSettings.("SYSTEM").("ComputerName")) {
				ForEach ($strComputerTempType in ($objComputers.($strComputerTempName).Keys | Sort-Object)) {
					If ($strComputerTempType -eq "XMRIG-PROXY") {
						ForEach ($strComputerTargetName in ($objComputers.($strComputerTempName).($strComputerTempType).Keys | Sort-Object)) {
							ForEach ($strComputerTargetType in $objComputers.($strComputerTempName).($strComputerTempType).($strComputerTargetName)) {
								If (($objComputers.ContainsKey($strComputerTargetName) -eq $true) -and ($objComputers.($strComputerTargetName).ContainsKey($strComputerTargetType) -eq $true)) {
									If ($objComputersTemp.ContainsKey($strComputerTargetName) -eq $false) {
										$objComputersTemp[$strComputerTargetName] = @{}
									}
									$objComputersTemp[$strComputerTargetName][$strComputerTargetType] = $objComputers.($strComputerTargetName).($strComputerTargetType)
								}
							}
							Remove-Variable -Name strComputerTargetType
						}
						Remove-Variable -Name strComputerTargetName
					} Else {
						If ($objComputersTemp.ContainsKey($strComputerTempName) -eq $false) {
							$objComputersTemp[$strComputerTempName] = @{}
						}
						$objComputersTemp[$strComputerTempName][$strComputerTempType] = $objComputers.($strComputerTempName).($strComputerTempType)
					}
				}
				Remove-Variable -Name strComputerTempType
			}
		}
	}
	Remove-Variable -Name strComputerTempName
	ForEach ($strComputerTemp in ($objComputersTemp.Keys | Sort-Object)) {
		ForEach ($strType in @("XMRIG-CPU", "XMRIG-NVIDIA", "XMRIG-AMD", "TRM")) {
			If ($objComputersTemp.($strComputerTemp).ContainsKey($strType) -eq $true) {
				If ($objLocalCounter.ContainsKey($strType) -eq $true) {
					$objLocalCounter[$strType] = $objLocalCounter.($strType) + 1
				} Else {
					$objLocalCounter[$strType] = 1
					If ($intGlobalCounter -eq 1) {
						$strEmailBody = "Start " + $strType.Replace("XMRIG-", "XMRig ") + " monitor script on """ + $objSettings.("SYSTEM").("ComputerName") + """ in " + (Get-Date -format "HH:mm:ss, dd MMMM yyyy") + "."
						$strResult = SendEmail $objEmail.("From").($strType) $objEmail.("To") ($objEmail.("Subject").($strType) + " on """ + $objSettings.("SYSTEM").("ComputerName") + """") ($objEmail.("Body") + $strEmailBody) $objEmail.("Attachment") $objEmail.("ServerAddress") $objEmail.("ServerPort") $objEmail.("Credential").($strType)
						Remove-Variable -Name strResult
						Remove-Variable -Name strEmailBody
					}
				}
				$objComputer	= $objComputersTemp.($strComputerTemp).($strType).Split(":")
				If (($objComputer[0] -ne "") -and ($objComputer[0] -match $strIPPattern)) {
					$strAddress	= $objComputer[0]
				} Else {
					$strAddress = ([System.Net.Dns]::GetHostAddresses($strComputerTemp) | Where-Object {$_.AddressFamily -eq "InterNetwork"} | Select-Object -First 1).IPAddressToString
				}
				If (($objComputer.Count -gt 1) -and ($objComputer[1] -ne "")) {
					$intPort	= $objComputer[1]
				} Else {
					$intPort	= $objSettings.("DEFAULT").("PORT").($strType)
				}
				If ($strAddress -match $strIPPattern) {
					If ($intPort -ne "") {
						$strMonitor	= ""
						$strStatistics	= ""
						$strUptime	= ""
						$strTotal	= ""
						If ($objInfo.ContainsKey($strComputerTemp) -eq $false) {
							$objInfo[$strComputerTemp]	= @{}
						}
						If ($objTotal.ContainsKey($strComputerTemp) -eq $false) {
							$objTotal[$strComputerTemp]	= @{}
						}
						If (($strType -eq "XMRIG-CPU") -or ($strType -eq "XMRIG-NVIDIA") -or ($strType -eq "XMRIG-AMD")) {
							If (($objComputer.Count -gt 2) -and ($objComputer[2] -ne "")) {
								$strToken	= $objComputer[2]
							} Else {
								$strToken	= $strComputerTemp
							}
							$objContent = TransformAPI $strType (GetAPI $strType $strAddress $intPort $strToken "")
							($objNotifications, $objConfirmations) = CheckHashTables $objNotifications $objConfirmations $strComputerTemp $strType "CONNECT" ""
							If (("version" -in $objContent.PSobject.Properties.Name) -and ($objContent.("version") -ne "")) {
								$objTimespan = [timespan]::fromseconds($objContent.("connection").("uptime"))
								$strMonitor += (Get-Time) + " """ + $strComputerTemp + """ """ + $strType + """ [INFO] Pool: """ + $objContent.("connection").("pool") + """, Algorytm: """ + $objContent.("algo") + """, Worker: """ + $objContent.("worker_id") + """, Shares good/total: " + $objContent.("results").("shares_good") + "/" + $objContent.("results").("shares_total") + ", Uptime: " + $objContent.("connection").("uptime") + " s (" + $objTimespan.days + " days, " + $objTimespan.hours.ToString("00") + ":" + $objTimespan.minutes.ToString("00") + ":" + $objTimespan.seconds.ToString("00") + ")"
								If (($objContent.("kind") -eq "nvidia") -or ($objContent.("kind") -eq "amd")) {
									$strMonitor += "`n"
									$strMonitor += (Get-Time) + " """ + $strComputerTemp + """ """ + $strType + """ [INFO] Fan: """ + $objContent.("health").("fan") + """, Temperature: """ + $objContent.("health").("temp") + """, Power: """ + $objContent.("health").("power") + """, Core Clock: """ + $objContent.("health").("clock") + """, Memory Clock: """ + $objContent.("health").("mem_clock") + """"
								}
								If ($objContent.("hashrate").("threads").Count -gt 0) {
									For ($i = 0 ; $i -lt $objContent.("hashrate").("threads").Count; $i++) {
										If ($i -gt 0) {
											$strStatistics += "`n"
										}
										$strStatistics += (Get-Time) + " """ + $strComputerTemp + """ """ + $strType + """ [INFO] Thread """ + $i.ToString("00") + """: speed 10s/60s/15m " + $objContent.("hashrate").("threads")[$i][0] + " " + $objContent.("hashrate").("threads")[$i][1] + " " + $objContent.("hashrate").("threads")[$i][2] + " H/s"
									}
								}
								$strTotal = (Get-Time) + " """ + $strComputerTemp  + """ """ + $strType + """ [INFO] Total      : speed 10s/60s/15m " + $objContent.("hashrate").("total")[0] + " " + $objContent.("hashrate").("total")[1] + " " + $objContent.("hashrate").("total")[2] + " H/s max " + $objContent.("hashrate").("highest") + " H/s"
#								$strUptime = (Get-Time) + " """ + $strComputerTemp + """ """ + $strType + """ [INFO] Uptime: " + $objTimespan.days + " days, " + $objTimespan.hours.ToString("00") + ":" + $objTimespan.minutes.ToString("00") + ":" + $objTimespan.seconds.ToString("00")
								$objInfo[$strComputerTemp][$strType] = "COMPUTER: """ + $strComputerTemp + """ (" + $strAddress + ":" + $intPort + ") [" + $strType.Replace("XMRIG-", "XMRig ") + "], Uptime: " + $objTimespan.days + " days, " + $objTimespan.hours.ToString("00") + ":" + $objTimespan.minutes.ToString("00") + ":" + $objTimespan.seconds.ToString("00")
								$objTotal[$strComputerTemp][$strType] = "H/R [10 sec]: " + $objContent.("hashrate").("total")[0] + " H/s, H/R [60 sec]: " + $objContent.("hashrate").("total")[1] + " H/s, H/R [15 min]: " + $objContent.("hashrate").("total")[2] + " H/s, Shares accepted: " + $objContent.("results").("shares_good") + ", Shares rejected: " + ($objContent.("results").("shares_total") - $objContent.("results").("shares_good"))
								($objNotifications, $objConfirmations) = CheckHashTables $objNotifications $objConfirmations $strComputerTemp $strType "POOL" $objContent.("connection").("pool")
								If (($objContent.("connection").("pool") -ne $null) -and ($objContent.("connection").("pool") -ne "")) {
									If ($objContent.("connection").("uptime") -eq 0) {
										($objNotifications, $objConfirmations) = ReportAlert $objSettings $objEmail $objNotifications $objConfirmations @{"COMPUTER" = $strComputerTemp ; "URL" = $objContent.("connection").("pool"); "STATUS" = ""; "TIME" = ""} $strType "POOL" $objContent.("connection").("pool")
									} Else {
										$objConfirmations[$strComputerTemp][$strType]["POOL"][$objContent.("connection").("pool")] = 0
									}
									($objNotifications, $objConfirmations) = CheckHashTables $objNotifications $objConfirmations $strComputerTemp $strType "HASHRATE" "TOTAL"
									If (($objHashrate.($strComputerTemp).($strType).("TOTAL") -ne $null) -and ($objHashrate.($strComputerTemp).($strType).("TOTAL") -ne "")) {
										If (($objContent.("hashrate").("total").Count -gt 2) -and ($objContent.("hashrate").("total")[2] -ne $null) -and ($objContent.("hashrate").("total")[2] -ne "")) {
											$intHashrate = $objContent.("hashrate").("total")[2]
										} Else {
											If (($objContent.("hashrate").("total").Count -gt 1) -and ($objContent.("hashrate").("total")[1] -ne $null) -and ($objContent.("hashrate").("total")[1] -ne "")) {
												$intHashrate = $objContent.("hashrate").("total")[1]
											} Else {
												$intHashrate = 0
											}
										}
										If ($intHashrate -ne 0) {
											If ($intHashrate -lt $objHashrate.($strComputerTemp).($strType).("TOTAL")) {
												($objNotifications, $objConfirmations) = ReportAlert $objSettings $objEmail $objNotifications $objConfirmations @{"COMPUTER" = $strComputerTemp; "H-API" = $intHashrate; "H-Template" = $objHashrate.($strComputerTemp).($strType).("TOTAL")} $strType "HASHRATE" "TOTAL"
											} Else {
												$objConfirmations[$strComputerTemp][$strType]["HASHRATE"]["TOTAL"] = 0
											}
										} Else {
											$objConfirmations[$strComputerTemp][$strType]["HASHRATE"]["TOTAL"] = 0
										}
										Remove-Variable -Name intHashrate
									} Else {
										$objConfirmations[$strComputerTemp][$strType]["HASHRATE"]["TOTAL"] = 0
									}
									For ($i = 0 ; $i -lt $objContent.("hashrate").("threads").Count; $i++) {
										($objNotifications, $objConfirmations) = CheckHashTables $objNotifications $objConfirmations $strComputerTemp $strType "HASHRATE" ("THREAD-" + $i.ToString("00"))
										If (($objContent.("hashrate").("threads")[$i].Count -gt 2) -and ($objContent.("hashrate").("threads")[$i][2] -ne $null) -and ($objContent.("hashrate").("threads")[$i][2] -ne "")) {
											$intHashrate = $objContent.("hashrate").("threads")[$i][2]
										} Else {
											If (($objContent.("hashrate").("threads")[$i].Count -gt 1) -and ($objContent.("hashrate").("threads")[$i][1] -ne $null) -and ($objContent.("hashrate").("threads")[$i][1] -ne "")) {
												$intHashrate = $objContent.("hashrate").("threads")[$i][1]
											} Else {
												$intHashrate = 0
											}
										}
										If ($intHashrate -ne 0) {
											If ($intHashrate -lt $objHashrate.($strComputerTemp).($strType).($i.ToString("00"))) {
												($objNotifications, $objConfirmations) = ReportAlert $objSettings $objEmail $objNotifications $objConfirmations @{"COMPUTER" = $strComputerTemp; "ID" = $i; "H-API" = $intHashrate; "H-Template" = $objHashrate.($strComputerTemp).($strType).($i.ToString("00"))} $strType "HASHRATE" ("THREAD-" + $i.ToString("00"))
											} Else {
												$objConfirmations[$strComputerTemp][$strType]["HASHRATE"][$i.ToString("00")] = 0
											}
										} Else {
											$objConfirmations[$strComputerTemp][$strType]["HASHRATE"][$i.ToString("00")] = 0
										}
										Remove-Variable -Name intHashrate
									}
									For ($i = 0 ; $i -lt $objContent.("health").Count; $i++) {
										($objNotifications, $objConfirmations) = CheckHashTables $objNotifications $objConfirmations $strComputerTemp $strType "TEMPERATURE" ("GPU-" + $i.ToString("00"))
										If (($objTemperature.($strComputerTemp).($strType).("GPU-" + $i) -ne $null) -and ($objTemperature.($strComputerTemp).($strType).("GPU-" + $i) -ne "")) {
											If (($objContent.("health")[$i].ContainsKey("temp")) -and ($objContent.("health")[$i].("temp") -ne $null) -and ($objContent.("health")[$i].("temp") -ne "")) {
												If ($objContent.("health")[$i].("temp") -gt ($objTemperature.($strComputerTemp).($strType).("GPU-" + $i) + $objSettings.("SCRIPT").("OTHER").("TemperatureAdjustment"))) {
													($objNotifications, $objConfirmations) = ReportAlert $objSettings $objEmail $objNotifications $objConfirmations @{"COMPUTER" = $strComputerTemp; "ID" = $i; "T-API" = $objContent.("health")[$i].("temp"); "T-Template" = ($objTemperature.($strComputerTemp).($strType).("GPU-" + $i) + $objSettings.("SCRIPT").("OTHER").("TemperatureAdjustment"))} $strType "TEMPERATURE" ("GPU-" + $i)
												} Else {
													$objConfirmations["TEMPERATURE"][$strComputerTemp]["GPU-" + $i][$strType] = 0
												}
											} Else {
												$objConfirmations["TEMPERATURE"][$strComputerTemp]["GPU-" + $i][$strType] = 0
											}
										}
									}
								} Else {
									$objConfirmations[$strComputerTemp][$strType]["POOL"][$objContent.("connection").("pool")] = 0
								}
								$objConfirmations[$strComputerTemp][$strType]["CONNECT"] = 0
							} Else {
								($objNotifications, $objConfirmations) = ReportAlert $objSettings $objEmail $objNotifications $objConfirmations @{"COMPUTER" = $strComputerTemp; "ADDRESS" = $strAddress; "PORT" = $intPort} $strType "CONNECT" ""
							}
						}
						If ($strType -eq "TRM") {
							$objPools = TransformAPI $strType (GetAPI $strType $strAddress $intPort "" "pools")
							If ($objPools.Count -gt 0) {
#								ForEach ($key in $objPools.Keys) {
#									If (($key -ne $null) -and ($key -ne "")) {
#										Write-Host ($key + ": " + $objPools.($key))
#									}
#								}
								($objNotifications, $objConfirmations) = CheckHashTables $objNotifications $objConfirmations $strComputerTemp $strType "POOL" $objPools.("Name")
								If ($objPools.("Status") -ne "Alive") {
									($objNotifications, $objConfirmations) = ReportAlert $objSettings $objEmail $objNotifications $objConfirmations @{"COMPUTER" = $strComputerTemp ; "URL" = $objPools.("URL"); "STATUS" = $objPools.("Status"); "TIME" = $objPools.("When")} $strType "POOL" $objPools.("Name")
								} Else {
									$objConfirmations[$strComputerTemp][$strType]["POOL"][$objPools.("Name")] = 0
								}
							}
							($objNotifications, $objConfirmations) = CheckHashTables $objNotifications $objConfirmations $strComputerTemp $strType "CONNECT" ""
							$objSummary	= TransformAPI $strType (GetAPI $strType $strAddress $intPort "" "summary")
							If ($objSummary.Count -gt 0) {
								($objNotifications, $objConfirmations) = CheckHashTables $objNotifications $objConfirmations $strComputerTemp $strType "HASHRATE" "TOTAL"
								If ($objPools.("Status") -eq "Alive") {
									If (($objHashrate.($strComputerTemp).($strType).("TOTAL") -ne $null) -and ($objHashrate.($strComputerTemp).($strType).("TOTAL") -ne "")) {
										If (([double]$objSummary.("KHS av") * 1000) -lt [double]$objHashrate.($strComputerTemp).($strType).("TOTAL")) {
											($objNotifications, $objConfirmations) = ReportAlert $objSettings $objEmail $objNotifications $objConfirmations @{"COMPUTER" = $strComputerTemp; "H-API" = ([double]$objSummary.("KHS av") * 1000); "H-Template" = $objHashrate.($strComputerTemp).($strType).("TOTAL")} $strType "HASHRATE" "TOTAL"
										} Else {
											$objConfirmations[$strComputerTemp][$strType]["HASHRATE"]["TOTAL"] = 0
										}
									}
								}
								$objGpucount = TransformAPI $strType (GetAPI $strType $strAddress $intPort "" "gpucount")
								If ($objGpucount.Count -gt 0) {
									If ($objGpucount.("Count") -gt 0) {
										For ($i = 0 ; $i -lt $objGpucount.("Count"); $i++) {
											($objNotifications, $objConfirmations) = CheckHashTables $objNotifications $objConfirmations $strComputerTemp $strType "GPU" ("GPU-" + $i)
											($objNotifications, $objConfirmations) = CheckHashTables $objNotifications $objConfirmations $strComputerTemp $strType "HASHRATE" ("GPU-" + $i)
											($objNotifications, $objConfirmations) = CheckHashTables $objNotifications $objConfirmations $strComputerTemp $strType "TEMPERATURE" ("GPU-" + $i)
											$objGpu = TransformAPI $strType (GetAPI $strType $strAddress $intPort "" ("gpu|" + $i))
											If ($objGpu.Count -gt 0) {
												If ($objGpu.("Status") -ne "Alive") {
													($objNotifications, $objConfirmations) = ReportAlert $objSettings $objEmail $objNotifications $objConfirmations @{"COMPUTER" = $strComputerTemp; "ID" = $i; "STATUS" = $objGpu.("Status")} $strType "GPU" ("GPU-" + $i)
												} Else {
													$objConfirmations[$strComputerTemp][$strType]["GPU"]["GPU-" + $i] = 0
													If (($objTemperature.($strComputerTemp).($strType).("GPU-" + $i) -ne $null) -and ($objTemperature.($strComputerTemp).($strType).("GPU-" + $i) -ne "")) {
														If ($objGpu.("Temperature") -gt ($objTemperature.($strComputerTemp).($strType).("GPU-" + $i) + $objSettings.("SCRIPT").("OTHER").("TemperatureAdjustment"))) {
															($objNotifications, $objConfirmations) = ReportAlert $objSettings $objEmail $objNotifications $objConfirmations @{"COMPUTER" = $strComputerTemp; "ID" = $i; "T-API" = $objGpu.("Temperature"); "T-Template" = ($objTemperature.($strComputerTemp).($strType).("GPU-" + $i) + $objSettings.("SCRIPT").("OTHER").("TemperatureAdjustment"))} $strType "TEMPERATURE" ("GPU-" + $i)
														} Else {
															$objConfirmations[$strComputerTemp][$strType]["TEMPERATURE"]["GPU-" + $i] = 0
														}
													}
												}
												If ($objPools.("Status") -eq "Alive") {
													If (($objHashrate.($strComputerTemp).($strType).("GPU-" + $i) -ne $null) -and ($objHashrate.($strComputerTemp).($strType).("GPU-" + $i) -ne "")) {
														If (([double]$objGpu.("KHS av") * 1000) -lt [double]$objHashrate.($strComputerTemp).($strType).("GPU-" + $i)) {
															($objNotifications, $objConfirmations) = ReportAlert $objSettings $objEmail $objNotifications $objConfirmations @{"COMPUTER" = $strComputerTemp; "ID" = $i; "H-API" = ([double]$objGpu.("KHS av") * 1000); "H-Template" = $objHashrate.($strComputerTemp).($strType).("GPU-" + $i)} $strType "HASHRATE" ("GPU-" + $i)
														} Else {
															$objConfirmations[$strComputerTemp][$strType]["HASHRATE"]["GPU-" + $i] = 0
														}
													}
												}
												$strMonitor += (Get-Time) + " """ + $strComputerTemp + """ """ + $strType + """ [INFO] GPU " + $i + " monitor: temp=" + [int]$objGpu.("Temperature") + ", fan=" + $objGpu.("Fan Percent") + ", " + $objGpu.("Fan Speed") + " rpm, " + $objGpu.("GPU Clock") + " coreclk, " + $objGpu.("Memory Clock") + " memclk, " + $objGpu.("GPU Voltage") + " vddc"
												$strStatistics += (Get-Time) + " """ + $strComputerTemp + """ """ + $strType + """ [INFO] GPU " + $i + " [" + [int]$objGpu.("Temperature") + "C, fan " + $objGpu.("Fan Percent") + "%] " + $objPools.("Algorithm") + ": " + $objGpu.("KHS 15s") + "kh/s, avg " + $objGpu.("KHS av") + "kh/s a:" + $objGpu.("Accepted") + " r:" + $objGpu.("Rejected") + "(" + $objGpu.("Device Rejected%") + "%) hw:" + $objGpu.("Hardware Errors") + "(" + $objGpu.("Device Hardware%") + "%)"
												If ($i -lt ($objGpucount.("Count") - 1)) {
													$strMonitor += "`n"
													$strStatistics += "`n"
												}
											}
										}
									}
								}
								$objTimespan = [timespan]::fromseconds($objSummary.("Elapsed"))
								$strUptime = (Get-Time) + " """ + $strComputerTemp + """ """ + $strType + """ [INFO] Uptime: " + $objTimespan.days + " days, " + $objTimespan.hours.ToString("00") + ":" + $objTimespan.minutes.ToString("00") + ":" + $objTimespan.seconds.ToString("00")
								$strTotal = (Get-Time) + " """ + $strComputerTemp  + """ """ + $strType + """ [INFO] Total                " + $objPools.("Algorithm") + ": " + $objSummary.("KHS 15s") + "kh/s, avg " + $objSummary.("KHS av") + "kh/s a:" + $objSummary.("Accepted") + " r:" + $objSummary.("Rejected") + "(" + $objSummary.("Device Rejected%") + "%) hw:" + $objSummary.("Hardware Errors") + "(" + $objSummary.("Device Hardware%") + "%)"
								$objInfo[$strComputerTemp][$strType] = "COMPUTER: """ + $strComputerTemp + """ (" + $strAddress + ":" + $intPort + ") [" + $strType + "], Uptime: " + $objTimespan.days + " days, " + $objTimespan.hours.ToString("00") + ":" + $objTimespan.minutes.ToString("00") + ":" + $objTimespan.seconds.ToString("00")
								$objTotal[$strComputerTemp][$strType] = "H/R [15 sec]: " + ([double]$objSummary.("KHS 15s") * 1000) + " H/s, H/R [AVG]: " + ([double]$objSummary.("KHS av") * 1000) + " H/s, Shares accepted: " + $objSummary.("Accepted") + ", Shares rejected: " + $objSummary.("Rejected") + ", Hardware Errors: " + $objSummary.("Hardware Errors")
								$objConfirmations[$strComputerTemp][$strType]["CONNECT"] = 0
							} Else {
								($objNotifications, $objConfirmations) = ReportAlert $objSettings $objEmail $objNotifications $objConfirmations @{"COMPUTER" = $strComputerTemp; "ADDRESS" = $strAddress; "PORT" = $intPort} $strType "CONNECT" ""
							}
						}
						If ($strUptime -ne "") {
							Write-Host $strUptime
						}
						If ($strMonitor -ne "") {
							Write-Host $strMonitor
						}
						If ($strStatistics -ne "") {
							Write-Host $strStatistics
						}
						If ($strTotal -ne "") {
							Write-Host $strTotal
						}
						Remove-Variable -Name strTotal
						Remove-Variable -Name strUptime
						Remove-Variable -Name strStatistics
						Remove-Variable -Name strMonitor
					}
				}
			}
		}
		Remove-Variable -Name strType
	}
	If ($objLocalCounter.Count -gt 0) {
		For ($i = 1; ($i -le $objSettings.("SCRIPT").("TIME").("Refresh")); $i += 1) {
			$strTextActivity = (Get-Time)
			$strTextStatus = "[" + $i.ToString().PadLeft($objSettings.("SCRIPT").("TIME").("Refresh").ToString().Length, "0") + "/" + $objSettings.("SCRIPT").("TIME").("Refresh").ToString() + "] Waiting " + ($objSettings.("SCRIPT").("TIME").("Refresh") - $i).ToString().PadLeft($objSettings.("SCRIPT").("TIME").("Refresh").ToString().Length, "0") + " seconds to update..."
#			Write-Progress -ID 1 -Activity $strTextActivity -Status $strTextStatus -CurrentOperation "   " -PercentComplete ($i * 100 / $objSettings.("SCRIPT").("TIME").("Refresh")) -SecondsRemaining ($objSettings.("SCRIPT").("TIME").("Refresh") - $i)
			Write-Progress -ID 1 -Activity $strTextActivity -Status $strTextStatus -CurrentOperation "   " -PercentComplete ($i * 100 / $objSettings.("SCRIPT").("TIME").("Refresh"))
			If ($i -eq 1) {
				$j = 1
				ForEach ($strComputerTemp in ($objComputersTemp.Keys | Sort-Object)) {
					If (($objTotal.ContainsKey($strComputerTemp) -eq $true) -and ($objInfo.ContainsKey($strComputerTemp) -eq $true)) {
						ForEach ($strType in @("XMRIG-CPU", "XMRIG-NVIDIA", "XMRIG-AMD", "TRM")) {
							If (($objTotal.($strComputerTemp).ContainsKey($strType) -eq $true) -and ($objInfo.($strComputerTemp).ContainsKey($strType) -eq $true)) {
								If (($objTotal.($strComputerTemp).($strType) -ne "") -and ($objInfo.($strComputerTemp).($strType) -ne "")) {
									$j += 1
									$strTextActivity = $objInfo.($strComputerTemp).($strType)
									$strTextStatus = $objTotal.($strComputerTemp).($strType)
									Write-Progress -ID $j -Activity $strTextActivity -Status $strTextStatus
								}
							}
						}
						Remove-Variable -Name strType
					}
				}
			}
			If ($i -lt $objSettings.("SCRIPT").("TIME").("Refresh")) {
				Start-Sleep -Seconds 1
			} Else {
				For ($k = $j; ($k -gt 1); $k -= 1) {
					Write-Progress -ID $k -Activity " " -Completed
				}
				Write-Progress -ID 1 -Activity " " -Completed
			}
		}
		Clear-Host
		Remove-Variable -Name objComputersTemp
		Remove-Variable -Name objLocalCounter
		Remove-Variable -Name objTotal
		Remove-Variable -Name objInfo
		Return $true
	} Else {
		Write-Host ((Get-Time) + " [INFO] Computer """ + $objSettings.("SYSTEM").("ComputerName") + """ was not found in configuration. Nothing to do.")
		Remove-Variable -Name objComputersTemp
		Remove-Variable -Name objLocalCounter
		Remove-Variable -Name objTotal
		Remove-Variable -Name objInfo
		Return $false
	}
}

$objNotifications	= @{}
$objConfirmations	= @{}
[int]$intGlobalCounter	= 0
[string]$strResult	= $true
While ($strResult -eq $true) {
	$intGlobalCounter += 1
	$strResult = Monitor $objSettings $objComputers $objHashrate $objTemperature $objEmail $objNotifications $objConfirmations $intGlobalCounter
}
