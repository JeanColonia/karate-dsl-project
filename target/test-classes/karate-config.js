function fn() {
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
  }
  var config = {
    apiURL:'https://conduit-api.bondaracademy.com/api/',
  }
  if (env == 'dev') {
    config.userEmail = 'jean123@test.com',
    config.userPassword = 'jean123'
  }
  if (env == 'qa') {
    config.userEmail = 'jean123@test.com',
    config.userPassword = 'jean123'
  } 
  
  else if (env == 'e2e') {
    // customize
  }


  var accessToken = karate.callSingle("classpath:helpers/features/CreateToken.feature", config).authToken;
  karate.configure('headers', { Authorization: 'Bearer '+ accessToken})

  return config;
}