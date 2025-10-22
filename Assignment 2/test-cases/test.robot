*** Settings ***
Resource  ../resources/resources.robot
Suite Teardown    Close Test Browsers

*** Test Cases ***
USER_AUTHENTICATION_TEST
    Sign Up
    Log In
    Log Out

ADD_REMOVE_CART_TEST
    Add To Cart
    Remove From Cart

PRODUCT_PURCHASE_TEST
    Buy Product
    