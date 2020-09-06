@createUser
Feature: Enroll the member with all the valid values

  Background:
    * url baseUrl
    * configure headers = getRequestHeaders('karateUser')


  Scenario: Submit a request to enroll a member
    * def memberPayload = read('classpath:Resources/PayLoads/User.json')
    * print 'value from json is ',memberPayload
    * set memberPayload.name = 'karate'+ RandomString
    * print "Name is ",memberPayload.first_name
    * set memberPayload.email = 'karate' + randomEmail()
    Given path '/public-api/users'
    And header Authorization = BearerToken
    And request memberPayload
    When method post
    Then status 200
    * print 'Response from the call is ',response.result
    Then match response contains
    """
 {
    "code": #number,
    "meta": null,
    "data": {
        "id": #number,
        "name": "#string",
        "email": "#string",
        "gender": "#string",
        "status": "#string",
        "created_at": "#string",
        "updated_at": "#string"
    }
}
    """
  * match response.data.name == 'karate'+ RandomString