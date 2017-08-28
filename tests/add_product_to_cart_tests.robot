*** Settings ***
Library                     SeleniumLibrary

*** Variables ***
${Username}                 rifky.ali.kiki@gmail.com
${Password}                 Password123$
${Browser}                  Chrome
${SiteUrl}                  https://kudo.co.id/shop/
${DashboardTitle}           Peluang Usaha dengan Modal Kecil - KUDO
${AccountFooter}            css=a[data-title="Akun"] div
${LoadingBar}               css=div.loading-wrapper img
${LoaderItem}               id=loader_items
${SearchKeyword}            free
${SubmitButton}             id=btnSubmit
${EmailField}               id=email-field
${PasswordField}            id=input_password
${SearchField}              css=input#input_item
${SearchResults}            xpath=//div[@class="product-info"]/div[contains(translate(., 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'),"${SearchKeyword}")]
${NumberOfSearchResults}    20
${LastItem}                 dom=document.getElementsByClassName("item")[document.getElementsByClassName("item").length - 1]
${ScrollToBottom}           document.getElementsByClassName("item")[document.getElementsByClassName("item").length - 1].scrollIntoView(true);
${BeliButton}               css=a#beli div
${MIBButton}                css=button#checkbox-mib-btn
${LanjutBelanja}            xpath=//a[contains(text(),"LANJUT BELANJA")]

*** Test Cases ***
Add Product To Cart
    User Already Logged In
    ${fail}=                             Set Variable                     0
    :FOR  ${index}  IN RANGE  3
    \    ${passed}=                      Run Keyword and Return Status    Add Product To Cart From Search Result
    \    Continue For Loop If            ${passed}
    \    ${fail}=                        ${fail} + 1
    ${success}=                          Set Variable                     3 - ${fail}
    Log Many                             Success:                         ${success}
    Log Many                             fail:                            ${fail}
    [Teardown]                           Close Browser

*** Keywords ***
Add Product To Cart From Search Result
    Search Product
    Wait for Loading
    Search Results Contain Keyword
    Scroll Down to the Bottom
    Select Last Item
    Wait for Loading
    Click Beli
    Wait for Loading
    Click Lanjut Belanja
    Wait for Loading

User Already Logged In
    Open Browser to the Kudo Page
    Wait for Loading
    Click Account
    Wait for Loading
    Enter User Name
    Wait for Loading
    Click Submit
    Wait for Loading
    Enter Password
    Wait for Loading
    Click Submit
    Wait for Loading
    Assert Dashboard Title

Open Browser to the Kudo Page
    Open Browser                         ${SiteUrl}                       ${Browser}
    Maximize Browser Window

Click Account
    Click Element                        ${AccountFooter}

Enter User Name
    Input Text                           ${EmailField}                    ${Username}

Click Submit
    Click Element                        ${SubmitButton}

Enter Password
    Input Text                           ${PasswordField}                 ${Password}

Wait for Loading
    Wait Until Element Is Not Visible    ${LoadingBar}
    Wait Until Element Is Not Visible    ${LoaderItem}

Assert Dashboard Title
    Title Should be                      ${DashboardTitle}

Search Product
    Input Text                           ${SearchField}                   ${SearchKeyword}
    Submit Form

Search Results Contain Keyword
    Locator Should Match X Times         ${SearchResults}                 ${NumberOfSearchResults}

Scroll Down to the Bottom
    Execute Javascript                   ${ScrollToBottom}

Select Last Item
    Click Element                        ${LastItem}

Click Beli
    Click Element                        ${BeliButton}

Click Saya Mengerti
    Click Element                        ${MIBButton}

Click Lanjut Belanja
    Click Element                        ${LanjutBelanja}
