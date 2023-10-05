Feature: shorten api

  Background: URL y Headers
    Given url 'https://url-shortener-service.p.rapidapi.com/'
    And headers {"X-RapidAPI-Key":"ea2cdca0bcmsh57aac766ea075e8p18b735jsn02a3121f4c1e"}
    And path 'shorten'

  Scenario Outline: Consulta validando response sea string
    And request {"url": "https://google.com/"}
    When method POST
    Then status <status>
    And match response.result_url == '#string'

    Examples:
      | status |
      | 200    |

  @ShortenGet
  Scenario Outline: valido peticion con sin pasar url
    * def respuesta = read('classpath:examples/users/response/shorten/rs_url_null.json')
    And request {}
    When method POST
    Then status <status>
    And match response == respuesta

    Examples:
      | status |
      | 400    |


  Scenario Outline: valido peticion con url invalida
    * def urlFalse = {"url": "google"}
    * def respuesta = read('classpath:examples/users/response/shorten/rs_invalidUrl.json')
    And request urlFalse
    When method POST
    Then status <status>
    And match response == respuesta

    Examples:
      | status |
      | 400    |

  Scenario Outline: valido token invalido
    * set header.X-Api-Key = 'NGUxMDM3M2YtYTQwNS00ZDhmLTkxNTUtZWJmYWFl0000000'
    * def urlFalse = {"url": "google"}
    * def respuesta = read('examples/users/response/shorten/rs_token_invalid.json')
    And request urlFalse
    When method POST
    Then status <status>
    And match response == respuesta

    Examples:
      | status |
      | 403    |