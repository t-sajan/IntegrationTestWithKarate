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

  Scenario: When username is sent empty user should not be able to login

    Given url 'http://localhost:5000/api/'
    And path '/login'
    And request {"username":"", "Password":"123"}
    And header Content-Type = 'application/json'
    When method post
    Then status 400
    And match response ==
      """
      {
      "error" : '#string'
      }
      """

  Scenario: When password is sent empty user should not be able to login

    Given url 'http://localhost:5000/api/'
    And path '/login'
    And request {"username":"abiral", "Password":""}
    And header Content-Type = 'application/json'
    When method post
    Then status 400
    And match response ==
      """
      {
      "error" : 'Missing password'
      }
      """

  Scenario: When username and password both is sent empty user should not be able to login

    Given url 'http://localhost:5000/api/'
    And path '/login'
    And request {"username":"", "Password":""}
    And header Content-Type = 'application/json'
    When method post
    Then status 400
    And match response ==
      """
      {
      "error" : '#string'
      }
      """