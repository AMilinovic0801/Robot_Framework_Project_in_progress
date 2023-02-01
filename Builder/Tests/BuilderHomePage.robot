*** Settings ***
Documentation    This is a Solo project for Automatization testing the BuilderAI site.
Resource        ../Resources/Common.robot
Resource        ../Resources/BuilderRe.robot
Task Setup      Common.Begin web test "Home Page"
Task Teardown   Common.End web test

#CMD: robot -d Results Tests/BuilderHomePage.robot

*** Variables ***


*** Test Cases ***
Verify all "Help Windows" load properly
    [Documentation]    User should see two pop up windows before home page
    [Tags]             1001     Smoke       PreHomePage
    BuilderRe.Assistance windows before "Home Page" loads

Verify "Home Page" loads correctly
    [Documentation]    User should see all elements on the Home Page.
    [Tags]             1002     Smoke       HomePage
    BuilderRe.All elements on "Home Page" should load correctly

User should be able to use "Filter Tabs"
    [Documentation]    User clicks on Tabs located above the Cards in the Home Page. 3 Tabs avalaible "All", "Pro", "Store". "All" button is tested in the previous test case.
    [Tags]             1003     Smoke       HomePage
    BuilderRe.All "Filter Tabs" should work

User should be able to use "Search bar"
    [Documentation]    User uses the "Search bar" to find appropriate cards.
    [Tags]             1004     Smoke       HomePage
    "Search bar" should work

User should be able to see all the avalaible currencies and pick Euro
    [Documentation]    User opens Currency tab in the top nav, sees all the available currencies and picks EUR.
    [Tags]             1005    Smoke       TopNav
    BuilderRe."Currency" button should work

User should be able to see and use the "Live Help" feature
    [Documentation]    User should see in the Top Nav the "Live Help" button. Three feature should be available.
    [Tags]             1006     Smoke       TopNav
    BuilderRe."Live Help" button should offer 3 features

User should be able to open "SignUp" window
    [Documentation]    User should be able to navigate to "SignUp" page using the "SignIn" button in Top Nav, and then clicking on the "Sign Up" link in the bottom.
    [Tags]             1007     Smoke       TopNav
    BuilderRe."SignIn" button should work

User should be able to "SignUp" to the web site using valid credentials
    [Documentation]    User should be able to sign up to the web site providing valid sign up info.
    [Tags]             1008     Functional      SignUp
    BuilderRe.Complete "SignUp" to the web site    ${VALID_USER_SIGNUP_CREDENTIALS}

User should be able to "SignIn" to the web site using valid credentials
    [Documentation]    User should be able to sign in to the web site providing valid sign in info.
    [Tags]             1009     Functional      SignIn
    BuilderRe.Complete "SignIn" to the web site    ${VALID_USER_SIGNIN_CREDENTIALS}