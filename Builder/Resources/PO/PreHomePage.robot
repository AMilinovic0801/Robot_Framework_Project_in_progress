*** Settings ***
Library    SeleniumLibrary
*** Variables ***
&{WELCOME_PAGE_CONTENT}                 Header=Welcome to Builder Studio    SubHead1=Step 1. Choose a base      SubHead2=Step 2. Make it your own      SubHead3=Step 3. Plan delivery
${CLICK_CHOOSE_A_BASE_BUTTON} =         xpath=//*[@id="main"]/welcome-to-studio/div/div[2]/div[2]/button
${FIRST_NAME_FIELD_ASSISTANT} =         xpath=//*[@id="app-component"]/div[1]/div[2]/main/app-home-templates/div[4]/div[3]/div[5]/div[2]/input
${CLOSE_ASSISTANT} =                    xpath=//div[@class="closeButton"]
${HOVER_OVER_ASSISTANT} =               xpath=//*[@id="main"]/div[2]/div[1]/div/div/h2/div[2]/div[3]/div[3]
${CLOSE_ASSISTANT_ON_HOME_PAGE} =       xpath=//*[@id="app-component"]/div[1]
${CANCEL_CARD} =                        xpath=//div[contains(@class, 'rightBlock')]
*** Keywords ***
Check if "Welcome" window contains correct text
    page should contain                 ${WELCOME_PAGE_CONTENT.Header}
    page should contain                 ${WELCOME_PAGE_CONTENT.SubHead1}
    page should contain                 ${WELCOME_PAGE_CONTENT.SubHead2}
    page should contain                 ${WELCOME_PAGE_CONTENT.SubHead3}
    click element                       ${CLICK_CHOOSE_A_BASE_BUTTON}
Check if "Personal Assistant" loads
    wait until element is visible       ${FIRST_NAME_FIELD_ASSISTANT}
    click element                       ${CLOSE_ASSISTANT}
Check if "Personal Assistant" loads on the Home page
    wait until page contains            Tell me what problem your app solves and I’ll help you build it.
    mouse over                          ${HOVER_OVER_ASSISTANT}
    click element                       ${CLOSE_ASSISTANT_ON_HOME_PAGE}



Skip "INTRO"
    click element                       ${CLICK_CHOOSE_A_BASE_BUTTON}
    click element                       ${CLOSE_ASSISTANT}
    click element                       ${CLOSE_ASSISTANT_ON_HOME_PAGE}

Cancel "Assistant"
    click element                       ${CLOSE_ASSISTANT_ON_HOME_PAGE}
    click element                       ${CANCEL_CARD}

Skip PreHomePage steps
    Skip "INTRO"
    Cancel "Assistant"
