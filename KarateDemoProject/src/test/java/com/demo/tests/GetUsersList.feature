@getusers
Feature: To get score details

  Background:
    * url baseUrl
    * configure headers = getRequestHeaders()
    * def getPath = '/public-api/users'
    * print 'Token is ',BearerToken

  Scenario: Get contactus review score details

    Given path getPath
    And header Authorization = BearerToken
    When method get
    Then status 200
    * print 'value from response is', response.data[0]
    Then match get[0] response.data contains
    """
    {
      "id": #number,
      "name": "#string",
      "email": "#string",
      "gender": "#string",
      "status": "#string",
      "created_at": "#string",
      "updated_at": "#string"
    }
    """

