*** Settings ***
Library     SeleniumLibrary
Resource    ../../InputData/AllData.robot

*** Variables ***
${SIGNIN_EMAIL_FIELD} =             xpath=//*[@id="loginEmailInput"]
${SIGNIN_PASSWORD_FIELD} =          xpath=//*[@id="app-component"]/div[2]/login/div/div[2]/div[3]/form/ul/li[2]/div[2]/input
${SIGNIN_CLICK_SUBMIT_BUTTON} =     xpath=//*[@id="app-component"]/div[2]/login/div/div[2]/div[3]/form/div[4]/div[1]
${SIGNIN_VERIFY_USER_SIGNED_IN} =   xapth=//*[@id="header"]/div/div/div[4]/ul/li/button


*** Keywords ***
Check if "Sign In" feature works
    [Arguments]                         ${user_info}
    Fill "Email" field                  ${user_info.Email}
    Fill "Password" field               ${user_info.Password}
    click element                       ${SIGNIN_CLICK_SUBMIT_BUTTON}
    Verify user logged in

Fill "Email" field
    [Arguments]   ${user_info.Email}
    input text    ${SIGNIN_EMAIL_FIELD}         ${user_info.Email}

Fill "Password" field
    [Arguments]   ${user_info.Password}
    input text    ${SIGNIN_PASSWORD_FIELD}      ${user_info.Password}

Verify user logged in
    wait until page does not contain element    ${SIGNIN_VERIFY_USER_SIGNED_IN}

