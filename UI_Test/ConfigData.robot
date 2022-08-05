*** Settings ***
Documentation    Suite description
Library     SeleniumLibrary

*** Variables ***
${url}      https://opensource-demo.orangehrmlive.com/index.php/auth/login
${browser}      chrome
#Below variables are related to  OrangeHRM Login page application object identification
${txtbox_username}     name=txtUsername
${txtbox_password}     name=txtPassword
${btn_login}        id=btnLogin
${txt_error}        id=spanMessage
${lnk_dashboard}    link=Dashboard
${lnk_welcome}      id=welcome
${lnk_logout}       link=Logout