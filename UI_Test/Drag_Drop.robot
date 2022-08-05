*** Settings ***
Documentation    Suite description
Library     SeleniumLibrary

*** Test Cases ***
Drag and Drop Functionality
    Open Browser   https://jqueryui.com/resources/demos/droppable/default.html    chrome
    Maximize Browser Window
    Drag And Drop  id=draggable   id=droppable
    Sleep  5s
    Close Browser