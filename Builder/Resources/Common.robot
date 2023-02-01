*** Settings ***
Library     SeleniumLibrary
Resource    ../InputData/AllData.robot
Resource    ../Resources/PO/PreHomePage.robot
Resource    ../Resources/PO/SignIn.robot
Resource    ../Resources/PO/TopNav.robot
*** Variables ***


*** Keywords ***
Begin web test "Home Page"

    #Initialize Selenium
    set selenium speed           0.2s
    set selenium timeout         10s

    #open the browser
    open browser                 about:blank        ${BROWSER}
    maximize browser window
    go to                        ${BASE_URL}


End web test
    close all browsers

Begin web test "User"
    #Initialize Selenium
    set selenium speed                              0.2s
    set selenium timeout                            10s

    #open the browser
    open browser                                    about:blank        ${BROWSER}
    maximize browser window
    go to                                           ${BASE_URL}
    PreHomePage.Skip PreHomePage steps
    TopNav.Click "SignIn Button"
    SignIn.Check if "Sign In" feature works         ${VALID_USER_SIGNIN_CREDENTIALS}
    sleep                                           1s
