Feature: project test feature

Background:
   * url 'https://api.todoist.com/rest/v1/'
   * configure headers = { 'Authorization': 'Bearer 723a87e9ff698dbea3aadb29de78b363f15c0abf' }

Scenario: getting all sections
    Given path 'sections'
    When method get
    Then status 200


Scenario: getting a individual secttion
    Given path 'sections/51193534'
    When method get
    Then status 200
    Then match response.name == 'Groceries'

Scenario: getting a section with wrong section id
    Given path 'section/50961803'
    When method get
    Then status 404
    Then match response =='Not Found'

Scenario: creating a section
    Given path 'sections'
    And request 
    """
        {
            "project_id":2267092410,
            "name" : "daily tasks"
        }
    """
    When method post 
    Then status 200
    Then match response.name == "daily tasks"

Scenario: deleting a section 
    Given path 'sections/51193534'
    When method delete
    Then status 204
    Then match response ==""

Scenario: deleting already deleted section
    Given path 'sections/51193534'
    When method delete
    Then status 404
