$CWD = Split-Path $MyInvocation.MyCommand.Path -parent
[System.Reflection.Assembly]::LoadFrom("$CWD\WebDriver.dll")
[System.Reflection.Assembly]::LoadFrom("$CWD\WebDriver.Support.dll")
$driver = New-Object OpenQA.Selenium.Chrome.ChromeDriver

# Slack�ɂĈ��A����
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
    Start-Sleep -s 3

    # Slack�̃R�����g��input�^�O�ł͂Ȃ����ߒ���DOM��������
    $driver.executeScript("var elm =document.querySelector('#msg_input .ql-editor'); elm.innerHTML = '<p>$greetingStr</p>';")

    # �R�����g
    $commentBtn = $driver.FindElementById("msg_input_send")
    $commentBtn.Click()

    # �u���E�U����
    $driver.close()
}


# �w�肵���v�f����ʂɕ\�������܂ő҂�
function waitForElement($locator, $timeInSeconds,[switch]$byClass,[switch]$byName){
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
