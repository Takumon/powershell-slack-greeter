# powershell-slack-greeter
Slackでの挨拶を肩代わりしてくれる人（PowerShellでSelenium使用）


## 実行方法
PowerShellで`greet.ps1`を実行してください。
実行時引数として挨拶の文言を指定できます。未指定の場合は「こんにちは！」です。

```
$ git clone https://github.com/Takumon/powershell-slack-greeter.git
$ cd powershell-slack-greeter
$ .\greet.ps1 おはようございます！
```

## 設定ファイル
`config.xml`を各自で設定してください。

|プロパティ名|説明|
|--|--|
|slackURL|コメント対象のチャンネルのURL|
|slackEmail|Slack登録アカウントのEmail|
|slackPassword|Slack登録アカウントのパスワード|

## 環境設定
* ChromeのWebDriverダウンロード
    * [公式サイト](https://docs.seleniumhq.org/download/)からChromeのWebDriverをダウンロード
    * `C:selenium`というフォルダを作成し`chromedriver.exe`を格納
* Seleniumダウンロード
    * [公式サイト](https://docs.seleniumhq.org/download/)からC#のクライアントをダウンロード
    * ZIPを解答して、さらに下記ファイルの拡張子を`nupkg`から`zip`に修正し解凍
        * Selenium.WebDriver.3.13.0.nupkg
        * Selenium.Support.3.13.0.nupkg
    * `C:\selenium\driver\lib\net40`というフォルダを作成し`Selenium.Support.3.13.0`の`lib\net40\WebDriver.dll`を格納
    * `Selenium.WebDriver.3.13.0`の`lib\net40\WebDriver.Support.dll`を`C:`に格納
* セキュリティブロックの解除 ※ `chromedriver.exe`,`WebDriver.dll`,`WebDriver.Support.dll`の３ファイルに対して実施
    * 対象ファイルを右クリック > プロパティ　を選択
    * プロパティの全般タブの下にセキュリティ　ブロック解除のチェックボックスをオンにする 

## ショートカットの作成
ショートカットで起動する場合は下記のようにする。  
```
C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -ExecutionPolicy RemoteSigned -File  greet.ps1のパス 挨拶の言葉
```
* greet.ps1のパスは各自で修正してください。
* 挨拶の言葉なので自分の好きな文言に修正してください。  


