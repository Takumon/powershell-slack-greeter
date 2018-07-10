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

## ショートカットの作成
ショートカットで起動する場合は下記のようにする。  
```
C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -ExecutionPolicy RemoteSigned -File  greet.ps1のパス 挨拶の言葉
```
* greet.ps1のパスは各自で修正してください。
* 挨拶の言葉なので自分の好きな文言に修正してください。  


