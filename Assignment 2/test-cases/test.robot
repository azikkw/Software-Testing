*** Settings ***
Resource  ../resources/resources.robot
Suite Teardown    Close Test Browsers

*** Test Cases ***
USER_SIGNUP_TEST
    Open Tests Browser
    Sign Up

USER_LOGIN_LOGOUT_TEST
    Open Tests Browser
    Log In
    Log Out

ADD_REMOVE_CART_TEST
    Open Tests Browser
    Add To Cart
    Remove From Cart

PRODUCT_PURCHASE_TEST
    Open Tests Browser
    Log In
    Buy Product
    