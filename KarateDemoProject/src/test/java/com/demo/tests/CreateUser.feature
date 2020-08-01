@createUser
Feature: Enroll the member with all the valid values

  Background:
    * url baseUrl
    * configure headers = getRequestHeaders('karateUser')


  Scenario: Submit a request to enroll a member
    * def memberPayload = read('classpath:Resources/PayLoads/User.json')
    * print 'value from json is ',memberPayload
    * set memberPayload.first_name = 'karate'+ RandomString
    * print "Name is ",memberPayload.first_name
    * set memberPayload.email = 'karate' + randomEmail()
    * set memberPayload.last_name = 'karate'+ RandomString
    Given path '/public-api/users'
    And header Authorization = BearerToken
    And request memberPayload
    When method post
    Then status 200
    Then match response.result contains
    """
     {
    "id": "#string",
    "first_name": "#string",
    "last_name": "#string",
    "gender": "#string",
    "dob": null,
    "email": "#string",
    "phone": null,
    "website": null,
    "address": null,
    "status": "active",
    "_links": {
      "self": {
        "href": "#string"
      },
      "edit": {
        "href": "#string"
      },
      "avatar": {
        "href": null
      }
    }
  }
    """
  * match response.result.first_name == 'karate'+ RandomString