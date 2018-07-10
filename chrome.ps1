$CWD = Split-Path $MyInvocation.MyCommand.Path -parent
[System.Reflection.Assembly]::LoadFrom("$CWD\WebDriver.dll")
[System.Reflection.Assembly]::LoadFrom("$CWD\WebDriver.Support.dll")
$driver = New-Object OpenQA.Selenium.Chrome.ChromeDriver

# Slack�ɂĈ��A����
# �������ŏI�I�Ȉ��A�̑��M�͐l�ɂ���Ă��炤
function greet($greetingStr, $config) {
    
    # �����̓Ƃ茾�`�����l����URL�ɃA�N�Z�X
    $driver.url = $config.slackUrl

    # ���O�C����ʕ\���҂�(���F�؂Ȃ̂Ń��_�C���N�g�����)
    waitForElement 'email' 20

    # ���O�C����ʂɂă��O�C��
    $email = $driver.FindElementById("email")
    $email.SendKeys($config.slackEmail)
    $pass = $driver.FindElementById("password")
    $pass.SendKeys($config.slackPassword)
    $btn = $driver.FindElementById("signin_btn")
    $btn.Click()

    # �v���L�V�ł͂������ꍇ�����邽�߂�����xSlack�`�����l����URL�ɃA�N�Z�X
    $driver.url = $config.slackUrl

    # ��ʕ\���҂�
    waitForElement 'msg_input' 20
    Start-Sleep -s 5

    # Slack�̃R�����g��input�^�O�ł͂Ȃ����ߒ���DOM��������
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
