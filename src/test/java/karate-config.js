function fn() {
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
  }
  var config = {
    env: env,
    myVarName: 'someValue',
    urlRnM: 'https://rickandmortyapi.com/api/',
    urlTokenLippiaAPI: 'https://authdev.lippia.io/realms/mvptest.lippia.io/protocol/openid-connect/token',
    urlLippiaAPI: 'https://backend-mvp.test.lippia.io/testmanager-mvp/'
  }
  if (env == 'dev') {
    // customize
    // e.g. config.foo = 'bar';
  } else if (env == 'e2e') {
    // customize
  }
  return config;
}