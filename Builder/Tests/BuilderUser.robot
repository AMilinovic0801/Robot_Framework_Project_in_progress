*** Settings ***
Documentation    This is a Solo project for Automatization testing the BuilderAI site.
Resource        ../Resources/Common.robot
Resource        ../Resources/BuilderRe.robot
Task Setup      Common.Begin web test "User"
Task Teardown   Common.End web test

#CMD: robot -d Results Tests/BuilderUser.robot

*** Variables ***


*** Test Cases ***
User should be able to see the "User Menu"
    [Documentation]    User should see User Menu when clicking on the profile immage in the TopNav.
    [Tags]             1001     Smoke       TopNav
    BuilderRe."user menu" should offer 3 features

User should be able to access all "User Menu" features
    [Documentation]    User should be able to use all user Menu features.
    [Tags]             1002     Smoke       UserMenu
    BuilderRe."Dashboard" page should be avalaiable
    BuilderRe."Setting" page should load
    BuilderRe.""Log Out" feature should work

User should be able to change his account information
    [Documentation]    Using settings page user should be able to update and change account information.
    [Tags]             1003     Functional      UserMenu
    BuilderRe."Setting" page features should work

User should be able to pick a card he wants to start his project
    [Documentation]    User should be able to choose any card on the home page in order to start his project based on the card he picked.
    [Tags]             1004     Functional      ProjectMenu
    BuilderRe.User should be able to pick a card
    BuilderRe.User should be able to delete features