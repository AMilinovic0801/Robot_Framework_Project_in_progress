*** Settings ***
Resource        ../Resources/PO/PreHomePage.robot
Resource        ../Resources/PO/HomePage.robot
Resource        ../Resources/PO/TopNav.robot
Resource        ../Resources/PO/SignUp.robot
*** Variables ***


*** Keywords ***
Assistance windows before "Home Page" loads
    PreHomePage.Check if "Welcome" window contains correct text
    PreHomePage.Check if "Personal Assistant" loads
    PreHomePage.Check if "Personal Assistant" loads on the home page

All elements on "Home Page" should load correctly
    PreHomePage.Skip "INTRO"
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
    HomePage.Check if "Search bar" on the Home Page works

"Currency" button should work
    PreHomePage.Skip "INTRO"
    TopNav.Check if all "Currency" is present in the list
    TopNav.Change "Currency" to Euro

"Live Help" button should offer 3 features
    PreHomePage.Skip "INTRO"
    TopNav.Check if "Live Help" button works

"SignIn" button should work
    PreHomePage.Skip "INTRO"
    TopNav.Get to "SignUp" window

Complete "SignUp" to the web site
    [Arguments]    ${user_info}
    PreHomePage.Skip "INTRO"
    TopNav.Get to "SignUp" window
    SignUp.Check if the "SignUp" feature works  ${user_info}