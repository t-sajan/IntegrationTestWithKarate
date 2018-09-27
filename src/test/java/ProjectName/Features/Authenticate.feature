Feature: Authentication Feature Test

  Scenario: When valid user credentials is entered user should be able to login
    Given url 'http://localhost:5000/api/'
    And path '/login'
    And request {"username":"abiral","password":"123"}
    And header Content-Type = 'application/json'
    When method post
    Then status 200
    * print response
    And match response ==
      """
      {
      "token" : '#string'
      }
      """
