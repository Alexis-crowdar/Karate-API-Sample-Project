Feature: Swagger
  @TokenLippiaAPI
  Scenario: POST Token
    Given url urlTokenLippiaAPI
    And header Content-Type = 'application/x-www-form-urlencoded'
    And form field client_id = 'admin-cli'
    And form field grant_type = 'password'
    And form field username = 'automation.ltm'
    And form field password = '1234'
    When method POST
    Then status 200
    * def auth = 'Bearer ',response.access_token
    And print auth



