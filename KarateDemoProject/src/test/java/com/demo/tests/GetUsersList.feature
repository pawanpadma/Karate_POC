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
    #* print 'value from response is', response
    * def product = { 'id': #number, 'product': '#string' }
    Then match each response.result contains
    """
    {
      "website": '#string',
      "address": '#string',
      "gender": '#string',
      "phone": '#string',
      "_links": {
        "edit": {
          "href": '#string'
        },
        "self": {
          "href": '#string'
        },
        "avatar": {
          "href": '#string'
        }
      },
      "dob": '#regex \\d{4}-\\d{2}-\\d{2}',
      "last_name": '#string',
      "id": '#string',
      "first_name": '#string',
      "email": '#string',
      "status": '#string'
    }
    """
    Then match  response.result[0] contains
    """
    {
      "website": '#string',
      "address": '#string',
      "gender": '#string',
      "phone": '#string',
      "_links": {
        "edit": {
          "href": '#string'
        },
        "self": {
          "href": '#string'
        },
        "avatar": {
          "href": '#string'
        }
      },
      "dob": '#regex \\d{4}-\\d{2}-\\d{2}',
      "last_name": '#string',
      "id": '#string',
      "first_name": '#string',
      "email": '#string',
      "status": '#string'
    }
    """

