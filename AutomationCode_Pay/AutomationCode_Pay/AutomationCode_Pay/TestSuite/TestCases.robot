*** Settings ***
Documentation  This is Test Suite for Pay
Library           SeleniumLibrary

*** Variables ***
${Url}   http://localhost:9999/statements
${Browser}  chrome

${amount1}  Balance before: 0.00 EUR
${amount2}  Balance after: 0.00 EUR

${amount3}  Balance before: 0.00 EUR
${amount4}  Balance after: 500.00 EUR

${amount5}  Balance before: 500.00 EUR
${amount6}  Balance after: 400.00 EUR

${amount7}  Balance before: 400.00 EUR
${amount8}  Balance after: 200.00 EUR

*** Keywords ***

*** Test Cases ***

TestCase1-Landing the application home page

    [Tags]  Smoke
    Open Browser   ${Url}  ${Browser}
    Set Selenium Implicit Wait            10s
    Maximize Browser Window

     [Tags]  Smoke

TestCase2-Clear Textbox and refresh the page
    Clear Element Text   search_account_id
    Clear Element Text   from_date
    Clear Element Text   to_date
    Click Button         Search


    [Tags]  Smoke

TestCase3-Check balance before and balance after value an initial phase
    Should Contain        /html/body/div/div[1]           ${amount1}
    Table Footer Should Contain    //div/div[2]/div      ${amount2}



     [Tags]  Fuctional

TestCase4-Specific client Nur initial turnover Test
    Clear Element Text   search_account_id
    Clear Element Text   from_date
    Clear Element Text   to_date
    Click Button         Search
    input text  search_account_id  Nur
    input text  from_date          2020-09-01 00:00:00
    input text  to_date            2020-09-06 00:00:00
    Should Contain        /html/body/div/div[1]           ${amount1}
    Table Footer Should Contain    //div/div[2]/div        ${amount2}


        [Tags]  Fuctional

TestCase5-Specific client Nur turnover Test after 1st transaction
    Clear Element Text   search_account_id
    Clear Element Text   from_date
    Clear Element Text   to_date
    Click Button         Search
    input text  search_account_id  Nur
    input text  from_date          2020-09-07 00:00:00
    input text  to_date            2020-09-09 09:20:20
    Click Button         Search
    Should Contain        /html/body/div/div[1]         ${amount3}
    Table Footer Should Contain    //div/div[2]/div      ${amount4}


         [Tags]  Fuctional

TestCase6-Specific client Nur turnover Test after 2nd transaction

    Clear Element Text   search_account_id
    Clear Element Text   from_date
    Clear Element Text   to_date
    Click Button         Search
    input text  search_account_id  Nur
    input text  from_date          2020-09-08 00:00:00
    input text  to_date            2020-09-09 09:40:20
    Click Button         Search
    Should Contain        /html/body/div/div[1]        ${amount5}
    Table Footer Should Contain    //div/div[2]/div    ${amount6}



      [Tags]  Fuctional

TestCase7-Specific client Nur turnover Test after 3rd transaction

    Clear Element Text   search_account_id
    Clear Element Text   from_date
    Clear Element Text   to_date
    Click Button         Search
    input text  search_account_id  Nur
    input text  from_date          2020-09-10 00:00:00
    input text  to_date            2020-09-13 09:20:20
    Click Button         Search
    Should Contain        /html/body/div/div[1]        ${amount5}
    Table Footer Should Contain    //div/div[2]/div    ${amount6}



