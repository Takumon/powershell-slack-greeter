# 外部スクリプト読み込み
$CWD = Split-Path $MyInvocation.MyCommand.Path -parent
. ("$CWD\chrome.ps1")
. ("$CWD\config.ps1")


echo "処理開始"

$greetingStr = if ($Args[0]) { $Args[0] } else { "こんにちは！" }

echo "挨拶の言葉 = $greetingStr"

$config = readConfig("$CWD\config.xml")
greet -greetingStr $greetingStr -config $config
echo "処理修了"


