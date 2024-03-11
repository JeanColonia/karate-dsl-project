# karate-dsl-project

### Starting project
    mvn archetype:generate \
     -DarchetypeGroupId=com.intuit.karate \
     -DarchetypeArtifactId=karate-archetype \
     -DarchetypeVersion=1.4.1 \
     -DgroupId=com.mycompany \
     -DartifactId=myproject

### Run All tests
    mvn test

### Running test by tags

    * Adding config to Runner:
        @Karate.Test
     Karate testTags() {
         return Karate.run("tags").tags("@second").relativeTo(getClass());
     }


    * Comand to run tests:
      mvn test -Dtest=SampleTest#testTags
    
    * Or try this command without the config above:
      mvn test -Dkarate.options="--tags @<tag name>"


### Running tests by tags and environment:

    mvn test -Dkarate.options="--tags @tagName" -Dkarate.env="environmentName"


### Data Generator with Faker 
    * Insert dependency in POM.xml

    <dependency>
    <groupId>com.github.javafaker</groupId>
    <artifactId>javafaker</artifactId>
    <version>1.0.2</version>
    </dependency>		

    * Create and Import data generator file to a feture:
      Java.type('helpers.data.DataGenerator')



### Docker File configs and run:

#### Build docker file:
      docker build -t karatetest . 