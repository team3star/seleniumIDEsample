Set-Location $PSScriptRoot
if ( -not ( Test-Path ./sampleLogs/ )){

  mkdir ./sampleLogs/

}

$logfile = './sampleLogs/next_dl_ids' + (Get-Date -Format "yyyyMMdd-HHmmss") + '.txt'

$videoList = Get-Content ./retryList.txt

foreach($fileURL in $videoList) {

    $fileURL = $fileURL.ToString();
    $fileTitle = $fileURL.replace('/','').replace('https:video.twimg.comext_tw_video','').replace('.mp4?tag=12','')

    try {
        Invoke-WebRequest ($fileURL) -OutFile ("U:\_0download\Twitter_MOV_DL_test\" + $fileTitle + ".mp4")
    } catch {
        "DL failed " + $fileURL >>  $logfile 
    }

}