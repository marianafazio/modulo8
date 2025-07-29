Feature: Registration at checkout

    As a customer of EBAC-SHOP
    I want to complete my registration
    To finalize my purchase

    Scenario: Registration with all required fields filled in correctly
        Given the customer is on the registration page
        When they fill in all the required fields correctly
        Then the registration should be successfully completed

    Scenario: Registration with invalid email
        Given the customer is on the registration page
        When they enter an email address in an invalid format
        Then the system should display an error message

    Scenario: Registration with empty required fields
        Given the customer is on the registration page
        When they try to register with empty required fields
        Then the system should display an alert message

    Scenario Outline: Attempt to register with different input data
        Given the customer is on the registration page
        When they fill <name> and <email>
        And submit the registration form
        Then the system should respond with <message>

        Examples:
            | name      | email           | message                             |
            | Ana Silva | ana@email.com   | Registration completed successfully |
            | João      | joao@com        | Invalid email format                |
            | Maria     |                 | Email is required                   |
            |           | maria@email.com | Name is required                    |