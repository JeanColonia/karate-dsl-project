Feature: Testing Articles

Background: Define url
 Given url 'https://conduit-api.bondaracademy.com/api/'
Scenario: Create a new article
 Given path 'users/login'
 * def payload = 
        """
          {
        "user": {
            "email": "jean123@test.com", 
            "password": "jean123"

        }
        }
         """
And request payload
When method POST
Then status 200
* def token = response.user.token

Given path 'articles'
And header Authorization = 'Bearer '+ token
* def articleBody = 
    """
     {
    "article": {
        "title": "test_006", "description": "test_article 6", "body": "desc article test 6", "tagList": ["test"]
        },
    "body": "desc article test 6"
    }
    """
 And request articleBody
 When method POST
 Then status 201
 And match response.article.title == 'test_006'



