# �O���X�N���v�g�ǂݍ���
$CWD = Split-Path $MyInvocation.MyCommand.Path -parent
. ("$CWD\chrome.ps1")
. ("$CWD\config.ps1")


echo "�����J�n"

$greetingStr = if ($Args[0]) { $Args[0] } else { "����ɂ��́I" }

echo "���A�̌��t = $greetingStr"

$config = readConfig("$CWD\config.xml")
greet -greetingStr $greetingStr -config $config
echo "�����C��"


