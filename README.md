# powershell-slack-greeter
Slackでの挨拶を肩代わりしてくれる人（PowerShellでSelenium使用）

## 設定ファイル
`config.xml`を各自で設定してください。

|プロパティ名|説明|
|--|--|
|slackURL|コメント対象のチャンネルのURL|
|slackEmail|Slack登録アカウントのEmail|
|slackPassword|Slack登録アカウントのパスワード|

## 実行方法
PowerShellで`greet.ps1`を実行してください。
実行時引数として挨拶の文言を指定できます。未指定の場合は「こんにちは！」です。

```
$ cd powershell-slack-greeter
$ .\greet.ps1 おはようございます！
```

## ショートカット
あらかじめ下記ショートカットを用意しています。  

|ショートカット名|挨拶|目的|
|--|--|--|
|hello|しゅっしゃ|会社に出社したことを伝える|
|lunch|おひる|今からお昼ご飯に行くことを伝える|
|bey|かえる|退社することを伝える|

## ショートカットの作成
独自で作成可能です。下記のようにリンク先を指定してください。
```
C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -ExecutionPolicy RemoteSigned -File  greet.ps1のパス 挨拶の言葉
```
* greet.ps1のパスは各自で修正してください。
* 挨拶の言葉なので自分の好きな文言に修正してください。  


