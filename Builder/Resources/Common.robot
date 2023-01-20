*** Settings ***
Library     SeleniumLibrary
Resource    ../InputData/AllData.robot
Resource    ../Resources/PO/PreHomePage.robot
*** Variables ***


*** Keywords ***
Begin web test

    #Initialize Selenium
    set selenium speed           0.2s
    set selenium timeout         10s

    #open the browser
    open browser                 about:blank        ${BROWSER}
    maximize browser window
    go to                        ${BASE_URL}


End web test
    close all browsers
