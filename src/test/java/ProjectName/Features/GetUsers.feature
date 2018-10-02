Feature: Get users list

  Scenario: When get request is sent get users list then available user list should be sent
    Given url 'http://localhost:5000/api/'
    And path '/users'
    And header Authorization = "beareer QpwL5tke4Pnpja7X"
    When method Get
    Then status 200
    * print response
    And match response ==
    """
  {
  "page": 1,
  "per_page": 3,
  "total": 12,
  "total_pages": 4,
  "data": [
  {
  "id": 1,
  "first_name": "George",
  "last_name": "Bluth",
  "avatar": "https://s3.amazonaws.com/uifaces/faces/twitter/calebogden/128.jpg"
  },
  {
  "id": 2,
  "first_name": "Janet",
  "last_name": "Weaver",
  "avatar": "https://s3.amazonaws.com/uifaces/faces/twitter/josephstein/128.jpg"
  },
  {
  "id": 3,
  "first_name": "Emma",
  "last_name": "Wong",
  "avatar": "https://s3.amazonaws.com/uifaces/faces/twitter/olegpogodaev/128.jpg"
  }
  ]
  }
   """
Scenario: When incorrect token is provided  in get request then unauthorized error should be sent to user
  Given url 'http://localhost:5000/api/'
  And path '/users'
  And header Authorization = "beareer QpwL5tke4Pnpja7XYZ"
  When method Get
  Then status 401
  * print response
  And match response ==
  """
  {
    "error": "Unauthorized"
}
  """