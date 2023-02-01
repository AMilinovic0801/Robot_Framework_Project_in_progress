*** Settings ***
Library     SeleniumLibrary


*** Variables ***
${HOME_PAGE_VERFY_CARD_LOADED} =                        xpath=//span[contains(text(), '9GAG')]
${HOME_PAGE_FILTERS} =                                  xpath=//ul[@class="filterListing"]/li
${HOME_PAGE_VERIFY_NUMBER_OF_FILTERS} =                 19
${HOME_PAGE_VERIFY_NUMBER_OF_FILTER_TABS} =             3
${HOME_PAGE_TITLE} =                                    xpath=//h2[contains(@class, 'title')]/strong[contains(text(), 'Choose')]
${HOME_PAGE_FILTER_TABS} =                              xpath=//*[@id="main"]/div[2]/div[2]/div[1]/div/ul/li
${HOME_PAGE_EXPLANATION} =                              Choose up to 3 templates (apps similar to your idea) to use as a base.
${HOME_PAGE_SEARCH_BUTTON} =                            xpath=//*[@id="main"]/div[2]/div[1]/div/div/div/div[1]/button/em
${HOME_PAGE_CUSTOM_TEMPLATE_BUTTON} =                   xpath=//*[@id="main"]/div[2]/div[1]/div/div/div/button
${HOME_PAGE_SORT_BUTTON} =                              xpath=//*[@id="main"]/div[2]/div[1]/div/div/div/div[2]/app-sort/div/button
${HOME_PAGE_CARDS} =                                    xpath=//div[contains(@class, 'Card')]
${HOME_PAGE_INITIAL_LOADED_CARDS} =                     15
${HOME_PAGE_FOOTER} =                                   xpath=//div[contains(@class, 'footerNewBottom')]
${HOME_PAGE_CLICK_PRO_BUTTON} =                         xpath=//*[@id="main"]/div[2]/div[2]/div[1]/div/ul/li[2]
${HOME_PAGE_PRO_BUTTON_DESCRIPTION} =                   Build apps, websites, wearables – any software you can imagine. No coding skills needed.
${HOME_PAGE_CLICK_STORE_BUTTON} =                       xpath=//*[@id="main"]/div[2]/div[2]/div[1]/div/ul/li[3]
${HOME_PAGE_STORE_BUTTON_DESCRIPTION} =                 Complete small business packages for a low monthly cost – includes award-winning apps,
${HOME_PAGE_CLICK_SEARCH_BUTTON} =                      xpath=//*[@id="main"]/div[2]/div[1]/div/div/div/div[1]/button
${HOME_PAGE_SEARCH_BOX} =                               xpath=//*[@id="main"]/div[2]/div[1]/div/div/div[2]/div[2]/input
@{HOME_PAGE_SEARCH_EXAMPLES} =                          Amazon      Asana       Facebook

*** Keywords ***
Check if all "Card Filters" load correctly
    ${number_of_filters} =                          get element count   ${HOME_PAGE_FILTERS}
    should be true                                  ${number_of_filters} == ${HOME_PAGE_VERIFY_NUMBER_OF_FILTERS}     "Filters not loaded, filter number should be 19!"

Check if "Home Page" title is correct
    wait until page contains element                ${HOME_PAGE_TITLE}

Check if "Home Page" contains filter tabs
    ${number_of_filter_tabs} =                      get element count   ${HOME_PAGE_FILTER_TABS}
    should be true                                  ${number_of_filter_tabs} == ${HOME_PAGE_VERIFY_NUMBER_OF_FILTER_TABS}         "Filter tabs not loaded, filter tab number should be 3!"
    page should contain                             ${HOME_PAGE_EXPLANATION}

Check if "Home Page" contains "Tool Bar"
    page should contain element                     ${HOME_PAGE_SEARCH_BUTTON}
    page should contain element                     ${HOME_PAGE_CUSTOM_TEMPLATE_BUTTON}
    page should contain element                     ${HOME_PAGE_SORT_BUTTON}

Check if "Home Page" loaded cards
    log                                             If User scrolls to the bottom of the page the number of the Cards should increase by incrament of 15. Initial number of loaded Cards should be 15.
    ${number_of_items} =                            Get Element Count    ${HOME_PAGE_CARDS}
    Should be equal as integers                     ${number_of_items}   ${HOME_PAGE_INITIAL_LOADED_CARDS}      #Initial 15 cards that should be loaded into the home page.
    ${flag} =                                       Set Variable    True
    WHILE                                           ${flag}
        Scroll Element Into View                    ${HOME_PAGE_FOOTER}
        ${number_of_items_new} =                    Get Element Count    ${HOME_PAGE_CARDS}
        Sleep    2s
        ${flag} =                                   Set Variable    ${number_of_items_new} > ${number_of_items}     #As long as the number of newly loaded cards is larger the loop will contiune and willstop only if the number is equal.
        ${number_of_items} =                        Set Variable    ${number_of_items_new}
        log                                         ${number_of_items_new}                  #Each itteration will log thenumber of loaded cards so we know what the count is, and if the page loads 15 cards at a time.
    END
Check if "Pro" filter tab works
    click element                                   ${HOME_PAGE_CLICK_PRO_BUTTON}
    wait until page contains                        ${HOME_PAGE_PRO_BUTTON_DESCRIPTION}

Check if "Store" filter tab works
    wait until element is visible                   ${HOME_PAGE_CLICK_STORE_BUTTON}
    click element                                   ${HOME_PAGE_CLICK_STORE_BUTTON}
    wait until page contains                        ${HOME_PAGE_STORE_BUTTON_DESCRIPTION}

Check if "Search bar" on the Home Page works
    click element                                   ${HOME_PAGE_CLICK_SEARCH_BUTTON}
    ${random_search_term} =                         Evaluate  random.choice(${HOME_PAGE_SEARCH_EXAMPLES})
    log                                             ${random_search_term}
    wait until element is visible                   ${HOME_PAGE_SEARCH_BOX}
    click element                                   ${HOME_PAGE_SEARCH_BOX}
    input text                                      ${HOME_PAGE_SEARCH_BOX}         ${random_search_term}
    wait until page contains                        "${random_search_term}"

Check if card loaded on page
    wait until page contains element                ${HOME_PAGE_VERFY_CARD_LOADED}


