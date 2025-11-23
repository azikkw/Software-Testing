*** Settings ***
Resource  ../resources/resources.robot
Suite Setup    Open Tests Browser
Suite Teardown    Close Test Browsers

*** Test Cases ***
USER_AUTHENTICATION_TEST
    Sign Up

USER_AUTHENTICATION_TEST
    Log In
    Log Out

ADD_REMOVE_CART_TEST
    Add To Cart
    Remove From Cart

PRODUCT_PURCHASE_TEST
    Log In
    Buy Product
    