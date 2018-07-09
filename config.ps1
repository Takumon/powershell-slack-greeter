# 設定ファイルを読み込む
function readConfig($path) {
    $xmlfile = [xml](Get-Content $path)

    $conf = @{}
    foreach($data in $xmlfile.config.data){
        $conf.Add($data.name, $data.value)
    }
    return $conf
}
