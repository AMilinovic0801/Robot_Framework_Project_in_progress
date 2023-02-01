*** Settings ***
Library    SeleniumLibrary
Library    FakerLibrary

*** Variables ***
${CREATING_CARD_REMOVE_FETURE_BUTTON} =                     xpath=//div[contains(@class, 'featureDescription')]//em[contains(@class, 'icon-delete')]
${CREATING_CARD_VERIFY_POP_UP} =                            xpath=//div[contains(@class, 'commonPopUp active')]//h3[contains(text(), 'remove it?')]
${CREATING_CARD_COMPLETE_REMOVAL} =                         xpath=//div[contains(@class, 'commonPopUp active')]//button[contains(text(), 'Yes')]
${CREATING_CARD_TOTAL_PRICE} =                              xpath=//div[contains(@class, 'maxpriceBox totalCost')]//strong
${CREATING_CARD_FEATURE_PRICE} =                            xpath=//div[contains(@class, 'featureDescription')]//h4
${CREATING_CARD_CARD_SELECTOR} =                            //div[contains(@class, 'filterList')]//div[contains(@class, 'templateCard')]
${CREATING_PROJECT_VERIFY_USER_PICK_CARD} =                 xpath=//div[contains(@class, 'rightSide')]//p
${CREATING_PROJECT_CLICK_BUILD_NOW_BUTTON} =                xpath=//div[contains(@class, 'rightSide')]//span[contains(text(), 'Build Now')]
${CREATING_PROJECT_VERIFY_PROJECT_LOADED} =                 xpath=//nav[@id='header']//div[contains(text(), 'View Prototype')]
${CREATING_PROJECT_VERIFY_CART_LOADED} =                    xpath=//div[contains(@id, 'studioFeatureanimation')]//div[contains(@class, 'mobilePrev')]
${CREATING_PROJECT_FEATURE_SELECTOR} =                      xpath=//div[contains(@class, 'ps ps--active-y')]//div[contains(@class, 'itemImg')]
${CREATING_PROJECT_FEATURE_NAME} =                          xpath=//div[contains(@class, 'topHead')]//h2[contains(text(), '')]

*** Keywords ***
Check if User can pick a card he wants to build
    ${cards}=                                           get webelements    ${CREATING_CARD_CARD_SELECTOR}
    ${card_count}=                                      get length          ${cards}
    ${random_index}=                                    evaluate           random.randint(0, ${card_count}-1)
    ${random_card}=                                     get webelements    ${cards}[${random_index}]
    Scroll Element Into View                            ${HOME_PAGE_FOOTER}
    mouse over                                          ${random_card}
    click element                                       ${random_card}
    wait until page contains element                    ${CREATING_PROJECT_VERIFY_USER_PICK_CARD}
    click element                                       ${CREATING_PROJECT_CLICK_BUILD_NOW_BUTTON}
    sleep                                               3s
    wait until page contains element                    ${CREATING_PROJECT_VERIFY_PROJECT_LOADED}


Check if User can delete features
    sleep                                               5s
    wait until page contains element                    ${CREATING_PROJECT_VERIFY_CART_LOADED}
    ${projects}=                                        get webelements    ${CREATING_PROJECT_FEATURE_SELECTOR}
    ${project_count}=                                   get length         ${projects}
    ${random_index}=                                    evaluate           random.randint(0, ${project_count}-1)
    ${random_project}=                                  get webelements    ${projects}[${random_index}]
    mouse over                                          ${random_project}
    click element                                       ${random_project}
    ${total_project_cost} =                             get text           ${CREATING_CARD_TOTAL_PRICE}
    ${feature_cost} =                                   get text           ${CREATING_CARD_FEATURE_PRICE}
    mouse over                                          ${CREATING_CARD_REMOVE_FETURE_BUTTON}
    click element                                       ${CREATING_CARD_REMOVE_FETURE_BUTTON}
    sleep                                               2s
    ${popup_exists}=                                    Run Keyword And Return Status       Check if pop up shows
    log                                                 ${popup_exists}
    run keyword if                                      "${popup_exists}" == "True"         Click to verify feature deletion

Check if pop up shows
    wait until page contains element                    ${CREATING_CARD_VERIFY_POP_UP}

Click to verify feature deletion
    click element                                       ${CREATING_CARD_COMPLETE_REMOVAL}





