Feature: project test feature

Background:
   * url 'https://api.todoist.com/rest/v1/'
   * configure headers = { 'Authorization': 'Bearer 723a87e9ff698dbea3aadb29de78b363f15c0abf' }

Scenario: get all tasks 
    Given path 'tasks'
    When method get
    Then status 200

Scenario: create a new task
    Given path 'tasks'
    And request
    """
{
    "content": "Buy Milk",
    "description": "",
    "comment_count": 0,
    "completed": false,
    "order": 1,
    "priority": 1,
    "project_id": 2267090232,
    "section_id": 0,
    "parent_id": 0, 
}
"""
    When method post
    Then status 200
    Then match response  ==  '#object'
    


Scenario: getting individual task
    Given path 'tasks/4896808301'
    When method get
    Then status 200
    Then match response  ==  '#object'
    Then match response.content == 'Buy Milk'

Scenario: Updating a task
    Given path 'tasks/4896808301'
    And request
    """
    {
    "content": "Buy groceries"
    }
    """
        When method post
        Then status 204
        Then match response  ==  ''  

Scenario: deleting a task
    Given path 'tasks/4896808301'
    When method delete
    Then status 204
    Then match response  ==  '' 

Scenario: getting a deletd task
    Given path 'tasks/4896808301'
    When method get
    Then status 404
    Then match response == 'Empty Token'