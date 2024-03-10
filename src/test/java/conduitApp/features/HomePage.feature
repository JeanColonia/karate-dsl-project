Feature: Test Home page

Background: Define URL
 Given url apiURL

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



@demo
Scenario: Get Articles
 * def timeValidator = read('classpath:helpers/validators/timeValidator.js')
 Given path 'articles'
 And params { limit : 10, offset : 0 }
 When method GET
 Then status 200
 * def articlesResponse = response
 * print articlesResponse
 And match response.articles == '#[10]'
 And match response.articlesCount == 17
 And match each response.articles == 
 """
  {
   "slug": "#string",
   "title": "#string",
   "description": "#string",
   "body": "#string",
   "tagList": "#array",
   "createdAt": "#? timeValidator(_)",
   "updatedAt": "#? timeValidator(_)",
   "favorited": "#boolean",
   "favoritesCount": "#number",
   "author": {
       "username": "#string",
       "bio": "##string",
       "image": "#string",
       "following": "#boolean"
   }
}
 """


