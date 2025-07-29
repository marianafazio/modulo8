Feature: Product configuration

        As a customer of EBAC-SHOP
        I want to configure my product according to my size and taste
        And choose the quantity
    So that I can add it to the cart

    Scenario: Verify required selections
        Given the customer is on the product page
        When they do not select color, size, and quantity
        Then the system must prevent adding the product to the cart

    Scenario Outline: Add product with different combinations
        Given I am on the product page
        When I select <color>, <size> and <quantity>
        Then the system should respond with <message>

        Examples:
            | color  | size | quantity | message                           |
            | blue   | XS   | 1        | Product added to cart             |
            | red    | S    | 10       | Product added to cart             |
            | orange | M    | 0        | Quantity must be between 1 and 10 |
            | blue   | L    | 11       | Quantity must be between 1 and 10 |
            |        | XL   | 5        | Color is required                 |
            | orange |      | 3        | Size is required                  |

    Scenario: Clear button
        Given the customer has made color, size, and quantity selections
        When they click the "clear" button
        Then the system should reset all selections to default