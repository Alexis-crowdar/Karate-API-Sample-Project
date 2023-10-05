Feature: Swagger
  @TokenLippiaAPI @ok
  Scenario: POST Token
    Given url urlTokenLippiaAPI
    And header Content-Type = 'application/x-www-form-urlencoded'
    And form field client_id = 'admin-cli'
    And form field grant_type = 'password'
    And form field username = 'automation.ltm'
    And form field password = '1234'
    When method POST
    Then status 200
    * def auth = response.access_token
    And print auth

  @GetProjects
  Scenario: GET Projects
    * def body = read('classpath:examples/users/request/lippiaAPI/getProjects.json')
    * def token = call read('@TokenLippiaAPI')
    * def authorization = 'Bearer '+ token.auth
    Given url urlLippiaAPI
    And path 'projects'
    And param q = 'Automation'
    And header Content-Type = 'application/json'
    And header Authorization = authorization
    And request body
    When method GET
    Then status 200

  @PostProject
  Scenario: POST Projects
    * def body = read('classpath:examples/users/request/lippiaAPI/postProjects.json')
    * def token = call read('@TokenLippiaAPI')
    * def authorization = 'Bearer '+ token.auth
    Given url urlLippiaAPI
    And path 'projects'
    And param q = 'Automation'
    And header Content-Type = 'application/json'
    And header Authorization = authorization
    And request body
    When method POST
    Then status 201
    * def id = response.id


  @DeleteProject
  Scenario: DELETE Projects
    * def body = read('classpath:examples/users/request/lippiaAPI/postProjects.json')
    * def token = call read('@TokenLippiaAPI')
    * def projectId = call read('@PostProject')
    * def authorization = 'Bearer '+ token.auth
    Given url urlLippiaAPI
    And path 'projects', projectId.id
    And param q = 'Automation'
    And header Content-Type = 'application/json'
    And header Authorization = authorization
    And request body
    When method DELETE
    Then status 201


  @PostRepository
  Scenario: POST repository
    * def body = read('classpath:examples/users/request/lippiaAPI/postRepository.json')
    * def token = call read('@TokenLippiaAPI')
    * def authorization = 'Bearer '+ token.auth
    Given url urlLippiaAPI
    And path 'repositories'
    And param q = 'Automation'
    And header Content-Type = 'application/json'
    And header Authorization = authorization
    And request body
    When method POST
    Then status 201





