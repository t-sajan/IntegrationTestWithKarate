Feature: Feature to test put request with name and job

  Scenario: When name and job is sent on a put request then the name and job field should be updated
    Given url 'http://localhost:5000/api/'
    And path '/users'
    And header Authorization = "beareer QpwL5tke4Pnpja7X"
    And header Content-Type = 'application/json'
    And request { "name": "morpheus", "job": "Azion resident" }
    When method put
    Then status 200
    * print response
    And match response ==
    """
    {
    "name": "morpheus",
    "job": "Azion resident",
    "updatedAt": "#string"
    }
    """

  Scenario: Given an incorrect token user should not be allowed to update the name and job field
    Given url 'http://localhost:5000/api/'
    And path '/users'
    And header Authorization = "beareer QpwL5tke4Pnpja7XYZ"
    And header Content-Type = 'application/json'
    And request { "name": "morpheus", "job": "Azion resident" }
    When method put
    Then status 401
    * print response
    And match response ==
    """
    {
    "error": "Unauthorized"
    }
    """