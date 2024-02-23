@Sample
Feature: Sample

  @RickAndMorty
  Scenario Outline: Get Character
    * def RickAndMortySchema = read('classpath:examples/jsonResponse/character.json')
    Given url urlRickAndMorty
    And path 'character', '<id_character>'
    When method GET
    Then status 200
    And match response.name == '<name>'
    And match response.status == '<status>'
    And match response == RickAndMortySchema
    * print response

    Examples:
      | id_character | name         | status |
      | 1            | Rick Sanchez | Alive  |
      | 2            | Morty Smith  | Alive  |

  @petstore
  Scenario Outline: Add a new pet to the store
    * def body = read('classpath:examples/jsonRequest/body.json')
    * def petSchema = read('classpath:examples/jsonResponse/pet.json')
    Given url urlPetStore
    And path 'pet'
    And header 'accept' = 'application/json'
    And header 'Content-Type' = 'application/json'
    And request body
    When method POST
    Then status 200
    And match response.name == '<name>'
    And match response == petSchema
    * print response

    Examples:
      | name   |
      | doggie |

  @petstore
  Scenario Outline: Add a new pet to the store
    * def body = read('classpath:examples/jsonRequest/body.json')
    * def petSchema = read('classpath:examples/jsonResponse/pet.json')
    Given url urlPetStore
    And path 'pet'
    And header 'accept' = 'application/json'
    And header 'Content-Type' = 'application/json'
    And request body
    And remove body.tag[0]
    And set body.tag[1].id = '15'
    And set body.tag[1].name = 'tag2'
    When method POST
    Then status 200
    And match response.name == '<name>'
    And match response == petSchema
    * print response

    Examples:
      | name   |
      | doggie |
