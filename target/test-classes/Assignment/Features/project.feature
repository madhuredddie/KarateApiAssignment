Feature: project test feature

Background:
   * url 'https://api.todoist.com/rest/v1/'
   * configure headers = { 'Authorization': 'Bearer 723a87e9ff698dbea3aadb29de78b363f15c0abf' }

Scenario: get all project  
    Given path 'projects'
    When method get
    Then status 200
    Then match response.Headers == 'Content-Type'

Scenario: create a project 
    Given path 'projects'
    And request
    """
    {
    "name": "Eatbles"
    }
    """
    When method post
    Then status 200
    Then match response  ==  '#object'
    Then match response.name == 'Eatbles'

    * def projectid= response.id

Scenario: getting asingle project
   Given path 'projects/2267272990'
   When method get
   Then status 200

Scenario:creating a project when limited is completd
   Given path 'projects'
    And request
    """
    {
    "name": "Slepping"
    }
    """
    When method post
    Then status 400
  
    



    
