*** Settings ***
Library     SeleniumLibrary
Resource    ../../InputData/AllData.robot


*** Variables ***
${USER_MENU_CLICK_DASHBOARD} =                  xpath=//*[contains(@class, 'userPanel active')]//li[contains(@class, 'dashBoard')]
${USER_MENU_VERIFIY_DASHBOARD} =                xpath=//*[contains(@class, 'dashboardArea')]//span[contains(text(), 'Dashboard')]
${USER_MENU_DISMISS_CARD} =                     xpath=//*[@id="app-component"]/div[2]/saveprogress/div/div[2]/div[3]/button[2]
&{USER_MENU_FILTER_CATEGORIES} =                Categorie1=STUDIO CALLS     Categorie2=BUILDCARDS       Categorie3=PROTOTYPES
${USER_MENU_FILTER_STUDIO_CALLS} =              xpath=//div[contains(@class, 'subMenu')]//div[contains(text(), 'Demo Calls')]
${USER_MENU_VERIFY_STUDIO_CALLS} =              2
${USER_MENU_FILTER_BUILDCARDS} =                xpath=//*[@id="app-component"]/div[1]/div[2]//div/div[1]/div[4]/ul/li
${USER_MENU_VERIFY_BUILDCARDS} =                7
${USER_MENU_PROTOTYPES} =                       xpath=//*[@id="app-component"]/div[1]/div[2]//div/div[1]/div[5]/ul/li
${USER_MENU_VERIFY_PROTOTYPES} =                3
${USER_MENU_ADDTIONAL_FEATURES} =               xpath=//div[contains(@class, 'withoutList')]//div[contains(text(), 'Additional')]
${USER_MENU_PAYMENTS} =                         xpath=//div[contains(@class, 'withoutList')]//div[contains(text(), 'Payments')]
${USER_MENU_SETTINGS} =                         xpath=//div[contains(@class, 'withoutList settings')]//div[contains(text(), 'Settings')]
${USER_MENU_CLICK_SETTING} =                    xpath=//div[contains(@class, 'userPanel active')]//span[contains(text(), 'Settings')]
${USER_MENU_VERFY_SETTINGS_PAGE_LOADED} =       Profile
${USER_MENU_GO_BACK_TO_HOME} =                  xpath=//nav[contains(@id, 'header')]//img[contains(@class, 'mainLogo')]
${USER_MENU_CANCEL_ASSISTANT} =                 xpath=//*[@id="header"]/div/div
${USER_MENU_CLICK_LOG_OUT} =                    xpath=//div[contains(@class, 'userPanel active')]//span[contains(text(), 'Log Out')]
${USER_MENU_VERIFY_USER_LOGGED_OUT} =           xpath=//*[@id="header"]/div/div/div[4]/h3/div
${USER_MENU_CLICK_EDIT_BUTTON_PROFILE} =        xpath=//div[contains(@class, 'profileView')]//button[contains(@class, 'editProfile')]
@{USER_MENU_CHANGE_RANDOM_NAME} =               John        Mike        Jasper      Ana
${USER_MENU_NAME_FIELD} =                       xpath=//*[@id="app-component"]//div[1]/div[2]/div[2]/ul/li[1]/input
${USER_MENU_LAST_NAME_FIELD} =                  xpath=//div[contains(@class, 'profilemiddle')]//input[contains(@name, 'lastName')]
@{USER_MENU_CHANGE_RANDOM_LAST_NAME} =          Smith       Walovitz        Kumar       Podolski
${USER_MENU_PASSWORD_FIELD} =                   xpath=//div[contains(@class, 'passwordField')]/input[contains(@placeholder, 'Type')]
@{USER_MENU_CHANGE_RANDOM_PASSWORD} =           prica12345      Pric@12345      Pric@!12345     Prica_AbC!
${USER_MENU_CONFIRM_NEW_PASSWORD} =             xpath=//div[contains(@class, 'passwordField')]/input[contains(@placeholder, 'Retype')]
${USER_MENU_CLICK_SAVE_BUTTON} =                xpath=//div[contains(@class, 'profileButton')]/button[contains(@class, 'saveButton')]
${USER_MENU_CLICK_NOTIFICATION_EDIT_BUTTON} =   xpath=//div[contains(@class, 'notificationSettings')]//div[contains(@class, 'cancel')]
${USER_MENU_WHATSAPP_RADIO_BUTTON} =            xpath=//div[contains(@class,'innerContainer')]/div[1]/div[3]//strong
${USER_MENU_SMS_RADIO_BUTTON} =                 xpath=//div[contains(@class,'innerContainer')]/div[2]/div[3]//strong
${USER_MENU_CLICK_NOTIFICATION_SAVE_BUTTON} =   xpath=//div[contains(@class, 'notificationSettings')]//button[contains(@class, 'Save')]
${USER_MENU_SCROLL_TO_COMPANY_MENU} =           xpath=//div[contains(@class, 'footerNewBottom')]
${USER_MENU_CLICK_COMPANY_EDIT_BUTTON} =        xpath=//div[contains(@class,'Questions')]/div[contains(@class, 'edit')]
${USER_MENU_CLICK_NEXT_DROP_DOWN} =             xpath=//div[contains(@class, 'profileView')]
@{USER_MENU_DROP_DOWN_QUESTION_0} =              //option[contains(text(), 'Stu')]       //option[contains(text(), 'Solo')]      //option[contains(text(), 'Mana')]      //option[contains(text(), 'Dire')]      //option[contains(text(), 'CEO, ')]     //option[contains(@id, 'option50')]
@{USER_MENU_DROP_DOWN_QUESTION_1} =              //option[contains(text(), '1 to 10')]       //option[contains(text(), '10 to 50')]      //option[contains(text(), '50 to 250')]         //option[contains(text(), '250 to 1000')]       //option[contains(text(), '1,000+')]    //option[contains(text(), 'Not App')]
@{USER_MENU_DROP_DOWN_QUESTION_2} =              //option[contains(text(), 'than 2 months')]     //option[contains(text(), '2 to 6')]        //option[contains(text(), '6 to 12')]       //option[contains(text(), '12 to 24')]      //option[contains(text(), '24 months +')]
@{USER_MENU_DROP_DOWN_QUESTION_3} =              //option[contains(text(), 'Less than €')]       //option[contains(text(), '€5,000 to')]     //option[contains(text(), '€20,000 to')]        //option[contains(text(), '€40,000+')]
@{USER_MENU_DROP_DOWN_QUESTION_4} =              //option[contains(text(), 'Entertainment')]     //option[contains(text(), 'Food')]      //option[contains(text(), 'Navigation')]        //option[contains(text(), 'News')]      //option[contains(text(), 'Travel')]
${USER_MENU_CLICK_COMPANY_SAVE_BUTTON} =         xpath=//*[contains(@class, 'questionUpdateButton')]//button[contains(text(), 'Save')]
*** Keywords ***
Check if user can access "Dashboard" menu
    click element                           ${USER_MENU_CLICK_DASHBOARD}
    click element                           ${USER_MENU_DISMISS_CARD}
    wait until page contains element        ${USER_MENU_VERIFIY_DASHBOARD}

Check if all features load on "Dashboard" menu
Verify Categories
    page should contain                     ${USER_MENU_FILTER_CATEGORIES.Categorie1}
    ${number_of_filters0} =                  get element count   ${USER_MENU_FILTER_STUDIO_CALLS}
    should be true                          ${number_of_filters0} == ${USER_MENU_VERIFY_STUDIO_CALLS}     "Studio Calls not loaded, number should be 2!"
    page should contain                     ${USER_MENU_FILTER_CATEGORIES.Categorie2}
    ${number_of_filters1} =                  get element count   ${USER_MENU_FILTER_BUILDCARDS}
    should be true                          ${number_of_filters1} == ${USER_MENU_VERIFY_BUILDCARDS}        "Buildcards not loaded, number should be 7!"
    page should contain                     ${USER_MENU_FILTER_CATEGORIES.Categorie3}
    ${number_of_filters2} =                  get element count   ${USER_MENU_PROTOTYPES}
    should be true                          ${number_of_filters2} == ${USER_MENU_VERIFY_PROTOTYPES}        "Prototypes not loaded, number should be 3!"
    page should contain element             ${USER_MENU_ADDTIONAL_FEATURES}
    page should contain element             ${USER_MENU_PAYMENTS}
    page should contain element             ${USER_MENU_SETTINGS}


Go back to "Home Page"
    click element                           ${USER_MENU_GO_BACK_TO_HOME}
    click element                           ${USER_MENU_CANCEL_ASSISTANT}
    sleep                                   1s

Check if User can access "Settings" menu
    click element                           ${USER_MENU_CLICK_SETTING}
    wait until page contains                ${USER_MENU_VERFY_SETTINGS_PAGE_LOADED}

Check if User can Log Out
    click element                           ${USER_MENU_CLICK_LOG_OUT}
    wait until element is not visible       ${USER_MENU_VERIFY_USER_LOGGED_OUT}

Check if User can change "Profile" information
    Check if User can access "Settings" menu
    click element                           ${USER_MENU_DISMISS_CARD}
    sleep                                   2s
    click element                           ${USER_MENU_CLICK_EDIT_BUTTON_PROFILE}
    ${random_name} =                        Evaluate  random.choice(@{USER_MENU_CHANGE_RANDOM_NAME})
    log                                     ${random_name}
    input text                              ${USER_MENU_NAME_FIELD}             ${random_name}
    click element                           ${USER_MENU_LAST_NAME_FIELD}
    ${random_last_name} =                   Evaluate  random.choice(@{USER_MENU_CHANGE_RANDOM_LAST_NAME})
    log                                     ${random_last_name}
    input text                              ${USER_MENU_LAST_NAME_FIELD}        ${random_last_name}
    click element                           ${USER_MENU_PASSWORD_FIELD}
    #${random_passsword} =                   Evaluate  random.choice(@{USER_MENU_CHANGE_RANDOM_PASSWORD})
    #log                                     ${random_passsword}
    #set global variable                     ${USER_MENU_NEW_PASSWORD}           ${random_passsword}
    #input text                              ${USER_MENU_PASSWORD_FIELD}         ${random_passsword}
    click element                           ${USER_MENU_CONFIRM_NEW_PASSWORD}
    input text                              ${USER_MENU_CONFIRM_NEW_PASSWORD}   ${VALID_USER_SIGNIN_CREDENTIALS.Password}
    click element                           ${USER_MENU_CLICK_SAVE_BUTTON}

Check if User can change "Notification settings"
    click element                           ${USER_MENU_CLICK_NOTIFICATION_EDIT_BUTTON}
    click element                           ${USER_MENU_WHATSAPP_RADIO_BUTTON}
    click element                           ${USER_MENU_SMS_RADIO_BUTTON}
    click element                           ${USER_MENU_CLICK_NOTIFICATION_SAVE_BUTTON}

Check if User can change "Company" information
    Scroll Element Into View                ${USER_MENU_SCROLL_TO_COMPANY_MENU}
    sleep                                   1s
    click element                           ${USER_MENU_CLICK_COMPANY_EDIT_BUTTON}
    ${random_answer1} =                      Evaluate  random.choice(@{USER_MENU_DROP_DOWN_QUESTION_0})
    ${random_answer2} =                      Evaluate  random.choice(@{USER_MENU_DROP_DOWN_QUESTION_1})
    ${random_answer3} =                      Evaluate  random.choice(@{USER_MENU_DROP_DOWN_QUESTION_2})
    ${random_answer4} =                      Evaluate  random.choice(@{USER_MENU_DROP_DOWN_QUESTION_3})
    ${random_answer5} =                      Evaluate  random.choice(@{USER_MENU_DROP_DOWN_QUESTION_4})
    @{random_answers} =                      Create List     ${random_answer1}     ${random_answer2}      ${random_answer3}       ${random_answer3}       ${random_answer4}
    FOR    ${question}    IN    @{random_answers}
        click element    ${USER_MENU_CLICK_NEXT_DROP_DOWN}
        click element    ${question}
        sleep    1s
    END
    click element                           ${USER_MENU_CLICK_COMPANY_SAVE_BUTTON}





