Feature: Test Home page

Background: Define URL
 Given url 'https://conduit-api.bondaracademy.com/api/'

@demo
Scenario: Get All Tags
Given path 'tags'
When method GET
Then status 200
* def tagResponse = response
* print tagResponse
And match response.tags contains ['Git', 'GitHub']
And match response.tags !contains ['Live']
And match response.tags == '#array'
And match each response.tags == '#string'



Scenario: Get Articles
 Given path 'articles'
 And params { limit : 10, offset : 0 }
 When method GET
 Then status 200
 * def articlesResponse = response
 * print articlesResponse
 And match response.articles == '#[10]'
 And match response.articlesCount == 10


