Feature: Registration (Sign up) feature for a new user

  Scenario: when valid email and password is entered new user is successfully registered
    Given url 'http://localhost:5000/api/'
    And path '/register'
    And request {"email": "sajan@test.com","password": "test123"}
    And header Content-Type = 'application/json'
    When method post
    Then status 201
    * print response
    And match response ==
    """
    {
    "token" : '#string'
    }
    """

  Scenario: when email field is empty then new user should not be registered
    Given url 'http://localhost:5000/api/'
    And path '/register'
    And request {"email": "","password": "test123"}
    And header Content-Type = 'application/json'
    When method post
    Then status 400
    * print response
    And match response ==
    """
    {
    "error" : '#string'
    }
    """

  Scenario: when password field is empty then new user should not be registered
    Given url 'http://localhost:5000/api/'
    And path '/register'
    And request {"email": "sajan@test.com","password": ""}
    And header Content-Type = 'application/json'
    When method post
    Then status 400
    * print response
    And match response ==
    """
    {
    "error" : '#string'
    }
    """



