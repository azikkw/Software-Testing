*** Settings ***
Library  SeleniumLibrary
Library    XML
Variables   ./locators.py
Variables   ./test-data.py

*** Keywords ***
Open Tests Browser
    Open Browser    ${baseUrl}  remote_url=${browserstack_url}
    Maximize Browser Window

Sign Up
    ${timestamp}=    Evaluate    int(__import__('time').time() * 1000)
    ${login}=        Set Variable    ${user_login_value}_${timestamp}
    Set Suite Variable    ${login}

    Wait Until Page Contains Element    ${sign_up_button}    timeout=20    error=sign_up_button not found
    Click Element   ${sign_up_button}
    
    Wait Until Page Contains Element    ${sign_up_username_field}    timeout=20    error=sign_up_username_field not found
    Sleep    1s
    
    Input Text    ${sign_up_username_field}    ${login}
    Input Password    ${sign_up_password_field}    ${user_password_value}
    
    Click Element    ${sign_up_form_button}
    Sleep    2s

Log In
    Wait Until Page Contains Element    ${log_in_button}    timeout=20    error=log_in_button not found
    Sleep    1s
    Click Element    ${log_in_button}

    Wait Until Page Contains Element    ${log_in_username_field}    timeout=20    error=log_in_username_field not found
    Sleep    1s

    Input Text    ${log_in_username_field}    ${user_login_value}
    Input Password    ${log_in_password_field}    ${user_password_value}

    Click Element    ${log_in_form_button}
    Sleep    2s

Log Out
    Wait Until Page Contains element    ${log_out_button}    timeout=20    error=log_out_button not found
    Sleep    1s
    
    Click element    ${log_out_button}
    Sleep    2s

Add To Cart
    Wait Until Page Contains element    ${open_product_page_button}    timeout=20    error=open_product_page_button not found
    Click Element    ${open_product_page_button}
    Sleep    1s

    Wait Until Page Contains element    ${add_to_cart_button}    timeout=20    error=add_to_cart_button not found
    Sleep    1s
    Click Element    ${add_to_cart_button}
    
    Handle Alert    action=ACCEPT
    Sleep    1s
    
    Click Element    ${cart_button}
    Sleep    2s

Remove From Cart
    Wait Until Page Contains Element    ${delete_from_cart_button}    timeout=20    error=delete_from_cart_button not found
    Click Element    ${delete_from_cart_button}
    Sleep    2s

Buy Product
    Wait Until Page Contains element    ${open_product_page_button}    timeout=20    error=open_product_page_button not found
    Click Element    ${open_product_page_button}
    Sleep    1s

    Wait Until Page Contains element    ${add_to_cart_button}    timeout=20    error=add_to_cart_button not found
    Sleep    1s
    Click Element    ${add_to_cart_button}
    
    Handle Alert    action=ACCEPT
    Sleep    1s
    
    Click Element    ${cart_button}
    
    Wait Until Page Contains Element    ${place_order_button}    timeout=20    error=place_order_button not found
    Sleep    1s
    Click Element    ${place_order_button}

    Wait Until Page Contains Element    ${form_name_field}    timeout=20    error=form_name_field not found
    Sleep    1s
    
    Input Text    ${form_name_field}    ${form_name_field_value}
    Input Text    ${form_country_field}    ${form_country_field_value}
    Input Text    ${form_city_field}    ${form_city_field_value}
    Input Text    ${form_credit_cart_field}    ${form_credit_cart_field_value}
    Input Text    ${form_month_field}    ${form_month_field_value}
    Input Text    ${form_year_field}    ${form_year_field_value}
    
    Click Element    ${purchase_order_button}
    
    Wait Until Page Contains Element    ${success_ok_button}    timeout=20    error=success_ok_button not found
    Sleep    1s
    Click Element    ${success_ok_button}
    Sleep    2s

Close Test Browsers
    Close All Browsers