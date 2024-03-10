Feature: Authorization Token

Scenario: Get token
        Given url 'https://conduit-api.bondaracademy.com/api/'
        And path 'users/login'
        * def payload = { "user": { "email": "#(userEmail)", "password": "#(userPassword)" } }
        And request payload
        When method POST
        Then status 200
        * def authToken = response.user.token
