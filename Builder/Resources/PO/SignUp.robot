*** Settings ***
Library     SeleniumLibrary
Resource    ../../InputData/AllData.robot


*** Variables ***
${SIGNUP_CLICK_CURRENCY_MENU} =             xpath=//*[@id="app-component"]/div[2]/login/div/div[2]/div[3]/form/ul/li[4]/div[1]/div[1]
${SIGNUP_CLICK_EURO_OPTION} =               xpath=//*[@id="app-component"]/div[2]/login/div/div[2]/div[3]/form/ul/li[4]/div[1]/div[2]/ol/li[1]
${SIGNUP_CLICK_AGREEMENT_CHECK_BOX} =       xpath=//*[@id="app-component"]/div[2]/login/div/div[2]/div[3]/form/ul/li[6]/label
${SIGNUP_EMAIL_FIELD} =                     xpath=//*[@id="loginEmailInput"]
${SIGNUP_NAME_FIELD} =                      xpath=//*[@id="app-component"]/div[2]/login/div/div[2]/div[3]/form/ul/li[2]/input
${SIGNUP_PHONE_FIELD} =                     xpath=//*[@id="app-component"]/div[2]/login/div/div[2]/div[3]/form/ul/li[3]/app-phone-number/div[1]/input[1]
${SIGNUP_PASSWORD_FIELD} =                  xpath=//*[@id="app-component"]/div[2]/login/div/div[2]/div[3]/form/ul/li[5]/div[1]/input


*** Keywords ***
Check if the "SignUp" feature works
    [Arguments]    ${user_info}
    Fill Email field                ${user_info.Email}
    Fill Name field                 ${user_info.Name}
    Fill PhoneNumber field          ${user_info.PhoneNumber}
    click element                   ${SIGNUP_CLICK_CURRENCY_MENU}
    click element                   ${SIGNUP_CLICK_EURO_OPTION}
    Fill Password field             ${user_info.Password}
    click element                   ${SIGNUP_CLICK_AGREEMENT_CHECK_BOX}

Fill Email field
    [Arguments]    ${user_info.Email}
    input text                      ${SIGNUP_EMAIL_FIELD}           ${user_info.Email}

Fill Name field
    [Arguments]    ${user_info.Name}
    input text                      ${SIGNUP_NAME_FIELD}            ${user_info.Name}

Fill PhoneNumber field
    [Arguments]     ${user_info.PhoneNumber}
    click element                   ${SIGNUP_PHONE_FIELD}
    input text                      ${SIGNUP_PHONE_FIELD}            ${user_info.PhoneNumber}

Fill Password field
    [Arguments]     ${user_info.Password}
    input text                      ${SIGNUP_PASSWORD_FIELD}        ${user_info.Password}

