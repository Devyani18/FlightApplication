*** Settings ***
Library           AutoItLibrary
Library           AppiumLibrary
Library           WADLibrary

*** Test Cases ***
CalculatorDemo
    run    C:/Program Files/Notepad++/notepad++.exe
    Win Wait Active    *new 1 - Notepad++
    ${text}    Win Get Text    *new 1 - Notepad++

TC01_LoginTrainingOrder
    AutoItLibrary.Run    TrainingOrderSystem.exe
    Win Wait Active    Sign in
    ${text}    Win Get Text    Sign in
    Control Set Text    Sign in    \    [NAME:txtUsername]    bp
    Control Set Text    Sign in    \    [NAME:txtPassword]    password
    Control Click    Sign in    \    [NAME:Button1]
