function fn() {
  var System = Java.type("java.lang.System")
  var env = karate.env; // get system property 'karate.env'
  var config = {
    db: {
    },
    clientProgramId : 30
  }
  if (!env) {
    env = 'staging';
  }

  if(env === 'qa'){
    config.baseUrl = 'https://gorest.co.in';

  } else if(env === 'staging'){
    config.baseUrl = 'https://gorest.co.in';

  }
  var getRequestHeaders = function() {
        var headers = {};

        headers['Accept'] = karate.get('*/*');
        headers['Content-Type'] = "application/json";
        return headers;
        }
  config.getRequestHeaders = getRequestHeaders;

//var result = karate.callSingle('classpath:com/api/commons/token.feature', config);
    // and it sets a variable called 'authInfo' used in headers-single.feature
    //config.authInfo = { authToken: result.Token };
    //config.mytoken= result.token;
     config.BearerToken= 'Bearer 1beb7ac19c18d03e3da482b3aca7e68525e2cfb7d95f6aaf7e3301468cc5cc8';
var randomEmail = function() {
        return 'karate-test-user' + Date.now() + Math.floor(Math.random() * 1000) + '@getnada.com'
    }

    config.randomEmail = randomEmail;
    var RandomString = karate.callSingle('classpath:Resources/CommonFeatures/RandomString.feature', randomEmail);
    config.RandomString = RandomString.Fname();
  return config;
}