Set-Location $PSScriptRoot
if ( -not ( Test-Path ./sampleLogs/ )){

  mkdir ./sampleLogs/

}

$logfile = './sampleLogs/next_dl_ids' + (Get-Date -Format "yyyyMMdd-HHmmss") + '.txt'

$htmldata = iwr "https://www.twidouga.net/ranking_tweek.php"

$videoList = $htmldata.links.href | sls 'video.twimg.com' | Sort-Object | Get-Unique;

foreach($fileURL in $videoList) {

    $fileURL = $fileURL.ToString();
    $fileTitle = $fileURL.replace('/','').replace('https:video.twimg.comext_tw_video','').replace('.mp4?tag=12','')

    try {
        Invoke-WebRequest ($fileURL) -OutFile ("U:\_0download\test\" + $fileTitle + ".mp4")
    } catch {
        "DL failed" + $fileURL >>  $logfile 
    }

}