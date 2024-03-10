Feature: Testing Articles

    Background: Define url
        Given url apiURL

                @TC_001_CREATE_ARTICLE 
                Scenario: Create a new article
                Given path 'articles'
                * def dataGenerator = Java.type('helpers.data.DataGenerator')
                * def articleBody = read('classpath:conduitApp/json/schemas/request/article.json')
                * set articleBody.article.title = dataGenerator.getRandomArticle().title
                * set articleBody.article.description = dataGenerator.getRandomArticle().description
                * set articleBody.article.body = dataGenerator.getRandomArticle().body

                And request articleBody
                When method POST
                Then status 201
                And match response.article.title == articleBody.article.title
                And match response.article.author.bio == '##string'



@TC_002_DELETE_ARTICLE 
Scenario: Create and delete an article
Given path 'articles'
And request { "article": {"title": "Test Delete Article", "description": "test_article 6", "body": "desc article test 6", "tagList": ["test"]},"body": "desc article test 6"}
When method POST
Then status 201
* def articleSlug = response.article.slug
* print articleSlug

Given params { limit: 10, offset:0 }
And path 'articles'
When method GET
Then status 200
And match response.articles[0].title == 'Test Delete Article'


Given path 'articles', articleSlug
When method DELETE
Then status 204

Given params { limit:10, offset:0 }
And path 'articles'
When method GET
Then status 200
And match response.articles[0].title != 'Test Delete Article'


