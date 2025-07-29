Feature: Login on the platform

    As a customer of EBAC-SHOP
    I want to log into the platform
    So that I can view my orders

    Scenario: Login with valid credentials
        Given the customer is on the login page
        When they enter a valid username and password
        Then they should be redirected to the checkout page

    Scenario: Login with invalid credentials
        Given the customer is on the login page
        When they enter an invalid username or password
        Then the system should display an alert message "Invalid username or password"

    Scenario Outline: Attempt to log in with different credentials
        Given the customer is on the login page
        When they enter <username> and <password>
        Then the system should respond with <message>

        Examples:
            | username | password | message                      |
            | maria1   | pass123  | Redirect to checkout page    |
            | joao2    | 123456   | Invalid username or password |