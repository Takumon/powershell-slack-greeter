$CWD = Split-Path $MyInvocation.MyCommand.Path -parent
[System.Reflection.Assembly]::LoadFrom("$CWD\WebDriver.dll")
[System.Reflection.Assembly]::LoadFrom("$CWD\WebDriver.Support.dll")
$driver = New-Object OpenQA.Selenium.Chrome.ChromeDriver

# Slackにて挨拶する
# ただし最終的な挨拶の送信は人にやってもらう
function greet($greetingStr, $config) {
    
    # 自分の独り言チャンネルのURLにアクセス
    $driver.url = $config.slackUrl

    # ログイン画面表示待ち(未認証なのでリダイレクトされる)
    waitForElement 'email' 20

    # ログイン画面にてログイン
    $email = $driver.FindElementById("email")
    $email.SendKeys($config.slackEmail)
    $pass = $driver.FindElementById("password")
    $pass.SendKeys($config.slackPassword)
    $btn = $driver.FindElementById("signin_btn")
    $btn.Click()

    # プロキシではじかれる場合があるためもう一度SlackチャンネルのURLにアクセス
    $driver.url = $config.slackUrl

    # 画面表示待ち
    waitForElement 'msg_input' 20
    Start-Sleep -s 5

    # Slackのコメントはinputタグではないため直接DOMをいじる
    $driver.executeScript("var elm =document.querySelector('#msg_input .ql-editor'); elm.innerHTML = '<p>$greetingStr</p>';")
}



function waitForElement($locator, $timeInSeconds,[switch]$byClass,[switch]$byName){
    #this requires the WebDriver.Support.dll in addition to the WebDriver.dll
    Add-Type -Path C:\WebDriver.Support.dll
    $webDriverWait = New-Object OpenQA.Selenium.Support.UI.WebDriverWait($script:driver, $timeInSeconds)
    try{
        if($byClass){
            $null = $webDriverWait.Until([OpenQA.Selenium.Support.UI.ExpectedConditions]::ElementIsVisible( [OpenQA.Selenium.by]::ClassName($locator)))
        }
        elseif($byName){
            $null = $webDriverWait.Until([OpenQA.Selenium.Support.UI.ExpectedConditions]::ElementIsVisible( [OpenQA.Selenium.by]::Name($locator)))
        }
        else{
            $null = $webDriverWait.Until([OpenQA.Selenium.Support.UI.ExpectedConditions]::ElementIsVisible( [OpenQA.Selenium.by]::Id($locator)))
        }
        return $true
    }
    catch{
        return "Wait for $locator timed out"
    }
}
