@ignore
Feature: Sign up - register

Background: preconditions to register user
 Given url apiURL

@register
Scenario: user registration
        Given path 'users'
        * def registrationPayload = { "email": "jose1@gmail.com", "password": "jose12", "username":"jose5"} 
        And request 
        """
         { "user": { "email": "#(registrationPayload.email)", "password": "#(registrationPayload.password)", "username":"#(registrationPayload.username)"} }
        """
        When method POST
        Then status 201
