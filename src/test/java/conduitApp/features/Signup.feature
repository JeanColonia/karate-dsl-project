
Feature: Sign up - register

Background: preconditions to register user
 Given url apiURL

@register
Scenario: user registration
        Given path 'users'
        * def dataGenerator = Java.type('helpers.data.DataGenerator')
        * def randomEmail = dataGenerator.getRandomEmail()
        * def randomUsername = dataGenerator.getRandomUsername()
        * def userSchemaValidation = read('classpath:conduitApp/json/schemas/response/validation/registerSchemaValidation.json')


        And request 
        """
         { "user": { "email": "#(randomEmail)", "password": "user123", "username":"#(randomUsername)"} }
        """
        When method POST
        Then status 201
        And match response.user == userSchemaValidation
