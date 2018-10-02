Feature: Test Delete feature

  Scenario: When delete request is sent then response should be 204 no content
    Given url 'http://localhost:5000/api/'
    And path '/users/2'
    And header Authorization = "beareer QpwL5tke4Pnpja7X"
    When method Delete
    Then status 204

  Scenario: When delete request is sent  with incorrect token then delete action should not be allowed
    Given url 'http://localhost:5000/api/'
    And path '/users/2'
    And header Authorization = "beareer QpwL5tke4Pnpja7XYZ"
    When method Delete
    Then status 401
    * print response
    And match response ==
    """
    {
    "error": "Unauthorized"
    }
    """