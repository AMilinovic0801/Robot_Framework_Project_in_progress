*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${TOPNAV_CURRENCY_AVAILABLE} =               xpath=//div[@class="userDropdownBox"]/div
${TOPNAV_VERIFY_CURRENCY_NUMBER} =           20
${TOPNAV_CLICK_CURRENCY_BUTTON} =            xpath=//*[@id="header"]/div/div/div[5]/span
${TOPNAV_CLICK_EURO_CURRENCY} =              xpath=//*[@id="header"]/div/div/div[5]/div/div/div[3]/span
${TOPNAV_VERIFY_CHANGE_TO_EUR} =             EUR
${TOPNAV_LIVE_HELP_BUTTON_DESCRIPTION} =     Talk to our experts
${TOPNAV_LIVE_HELP_BUTTON} =                 xpath=//*[@id="header"]/div/div/div[7]/div[2]
&{TOPNAV_LIVE_HELP_SUBMENU} =                Feature1=Live Demo     Feature2=Spec Call      Feature3=Live Chat
${TOPNAV_SIGNIN_BUTTON} =                    xpath=//*[@id="header"]/div/div/div[4]/ul/li/button
${TOPNAV_SIGNIN_HEADER} =                    Sign In
${TOPNAV_SIGNUP_BUTTON} =                    xpath=//*[@id="app-component"]/div[2]/login/div/div[2]/div[3]/form/div[4]/div[2]/span
${TOPNAV_SIGNUP_HEADER} =                    Sign up

*** Keywords ***
Check if all "Currency" is present in the list
    click element                   ${TOPNAV_CLICK_CURRENCY_BUTTON}
    log                             The actual number of "Currency" in the list is 10 but the page is made in a way that the locators are duplicated for this feature, so 20 locators means 10 "Currency".
    ${number_of_currencies} =       get element count   ${TOPNAV_CURRENCY_AVAILABLE}
    should be true                  ${number_of_currencies} == ${TOPNAV_VERIFY_CURRENCY_NUMBER}     "Currency list not loaded, number of currency should be 10!"

Change "Currency" to Euro
    mouse over                      ${TOPNAV_CLICK_EURO_CURRENCY}
    click element                   ${TOPNAV_CLICK_EURO_CURRENCY}
    sleep                           1s
    wait until page contains        ${TOPNAV_VERIFY_CHANGE_TO_EUR}

Check if "Live Help" button works
    page should contain             ${TOPNAV_LIVE_HELP_BUTTON_DESCRIPTION}
    mouse over                      ${TOPNAV_LIVE_HELP_BUTTON}
    wait until page contains        ${TOPNAV_LIVE_HELP_SUBMENU.Feature1}
    wait until page contains        ${TOPNAV_LIVE_HELP_SUBMENU.Feature2}
    wait until page contains        ${TOPNAV_LIVE_HELP_SUBMENU.Feature3}

Click "SignIn Button"
    click element                   ${TOPNAV_SIGNIN_BUTTON}
    wait until page contains        ${TOPNAV_SIGNIN_HEADER}

Get to "SignUp" window
    click element                   ${TOPNAV_SIGNIN_BUTTON}
    wait until page contains        ${TOPNAV_SIGNIN_HEADER}
    click element                   ${TOPNAV_SIGNUP_BUTTON}
    wait until page contains        ${TOPNAV_SIGNUP_HEADER}