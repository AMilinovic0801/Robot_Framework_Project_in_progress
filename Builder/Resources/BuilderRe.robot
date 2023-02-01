*** Settings ***
Resource        ../Resources/PO/PreHomePage.robot
Resource        ../Resources/PO/HomePage.robot
Resource        ../Resources/PO/TopNav.robot
Resource        ../Resources/PO/SignUp.robot
Resource        ../Resources/PO/SignIn.robot
Resource        ../Resources/PO/UserMenu.robot
Resource        ../Resources/PO/CreatingProject.robot
*** Variables ***


*** Keywords ***
Assistance windows before "Home Page" loads
    PreHomePage.Check if "Welcome" window contains correct text
    PreHomePage.Check if "Personal Assistant" loads
    PreHomePage.Check if "Personal Assistant" loads on the home page

All elements on "Home Page" should load correctly
    PreHomePage.Skip "INTRO"
    PreHomePage.Cancel "Assistant"
    HomePage.Check if all "Card Filters" load correctly
    HomePage.Check if "Home Page" title is correct
    HomePage.Check if "Home Page" contains filter tabs
    HomePage.Check if "Home Page" contains "Tool Bar"
    Check if "Home Page" loaded cards

All "Filter Tabs" should work
    PreHomePage.Skip "INTRO"
    HomePage.Check if all "Card Filters" load correctly
    HomePage.Check if "Pro" filter tab works
    PreHomePage.Cancel "Assistant"
    HomePage.Check if "Store" filter tab works

"Search bar" should work
    PreHomePage.Skip "INTRO"
    PreHomePage.Cancel "Assistant"
    HomePage.Check if "Search bar" on the Home Page works

"Currency" button should work
    PreHomePage.Skip "INTRO"
    PreHomePage.Cancel "Assistant"
    TopNav.Check if all "Currency" is present in the list
    TopNav.Change "Currency" to Euro

"Live Help" button should offer 3 features
    PreHomePage.Skip "INTRO"
    TopNav.Check if "Live Help" button works

"SignIn" button should work
    PreHomePage.Skip "INTRO"
    PreHomePage.Cancel "Assistant"
    TopNav.Get to "SignUp" window

Complete "SignUp" to the web site
    [Arguments]    ${user_info}
    PreHomePage.Skip "INTRO"
    PreHomePage.Cancel "Assistant"
    TopNav.Get to "SignUp" window
    SignUp.Check if the "SignUp" feature works  ${user_info}

Complete "SignIn" to the web site
    [Arguments]    ${user_info}
    PreHomePage.Skip "INTRO"
    PreHomePage.Cancel "Assistant"
    TopNav.Click "SignIn Button"
    SignIn.Check if "Sign In" feature works    ${user_info}

"User Menu" should offer 3 features
    TopNav.Check if "User Menu" has all elements

"Dashboard" page should be avalaiable
    TopNav.Click "User Menu"
    UserMenu.Check if user can access "Dashboard" menu
    UserMenu.Check if all features load on "Dashboard" menu

"Setting" page should load
    UserMenu.Go back to "Home Page"
    TopNav.Click "User Menu"
    UserMenu.Check if User can access "Settings" menu

""Log Out" feature should work
    UserMenu.Go back to "Home Page"
    TopNav.Click "User Menu"
    UserMenu.Check if User can Log Out

"Setting" page features should work
    TopNav.Click "User Menu"
    UserMenu.Check if User can change "Profile" information
    UserMenu.Check if User can change "Notification settings"
    UserMenu.Check if User can change "Company" information

User should be able to pick a card
    HomePage.Check if card loaded on page
    HomePage.Check if "Home Page" title is correct
    CreatingProject.Check if User can pick a card he wants to build

User should be able to delete features
    CreatingProject.Check if User can delete features