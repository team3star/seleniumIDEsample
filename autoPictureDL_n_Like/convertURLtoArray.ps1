$result = (Test-Path "./sampleLogs/")

if(!$result){
    mkdir ./sampleLogs/
}

$logfile = './sampleLogs/twitter_array' + (Get-Date -Format "yyyyMMdd-HHmmss") + '.txt'
$err_logfile = './sampleLogs/twitter_array' + (Get-Date -Format "yyyyMMdd-HHmmss") + '_err.txt'

$TmpFile = New-TemporaryFile

$array_from_txt = ( Get-Content -Encoding UTF8 ./image_URL_list.txt ).Replace("https://twitter.com/", "")
$array_from_txt = $array_from_txt.Replace("https://mobile.twitter.com/", "")



'
Twitter Pictures URL SeleniumIDE(start)
' >> $logfile

'return [' | Out-File $logfile -NoNewline -Append

foreach($id in $array_from_txt) {

    if($id.IndexOf("status") -ne -1) {

      '"' + $id +'",' | Out-File $logfile -NoNewline -Append

    } else {
      $id | Out-File $err_logfile -Append
    
    }
}

'""]' | Out-File $logfile -NoNewline -Append

'
Twitter Pictures URL SeleniumIDE(end)
' >> $logfile
