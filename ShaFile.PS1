function Get-FileSHA1($filePath){
    $fileContent = Get-Content $filePath
    $fileBytes = [System.Text.Encoding]::UTF8.GetBytes($fileContent)
    $sha1 = New-Object System.Security.Cryptography.SHA1Managed
    $hash = $sha1.ComputeHash($fileBytes)

    $prettyHashSB = New-Object System.Text.StringBuilder
    foreach ($byte in $hash) {
        $hexaNotation = $byte.ToString("X2")
        $prettyHashSB.Append($hexaNotation)
    }

    Write-Host $prettyHashSB.ToString() -BackgroundColor Red -ForegroundColor Yellow
}

Get-FileSHA1 C:\Users\Mathe\Desktop\projetos\Explorando-PowerShell\ShaFile.PS1