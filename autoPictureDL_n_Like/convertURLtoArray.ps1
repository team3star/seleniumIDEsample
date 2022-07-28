$result = (Test-Path "./sampleLogs/")

if(!$result){
    mkdir ./sampleLogs/
}

$logfile = './sampleLogs/twitter_array' + (Get-Date -Format "yyyyMMdd-HHmmss") + '.txt'
$TmpFile = New-TemporaryFile

$array_from_txt = ( Get-Content -Encoding UTF8 ./image_URL_list.txt ).Replace("https://twitter.com/", "")
$array_from_txt = $array_from_txt.Replace("https://mobile.twitter.com/", "")

'
Twitter Pictures URL SeleniumIDE(start)
' >> $logfile

'return [' | Out-File $logfile -NoNewline -Append

foreach($id in $array_from_txt) {
    '"' + $id +'",' | Out-File $logfile -NoNewline -Append
}

'""]' | Out-File $logfile -NoNewline -Append

'
Twitter Pictures URL SeleniumIDE(end)
' >> $logfile
