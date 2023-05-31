Feature: Get current air quality data for a given city
  Scenario: Successful retrieval of air quality
    When I navigate to the "Current" page
    And I select "Aveiro" as the target city
    And I click on the retrieve button
    Then I should see a table with the results

  Scenario: Unsuccessful retrieval of air quality
    When I navigate to the "Current" page
    When I select "xpto" as the target city
    And I click on the retrieve button
    Then I should see a message "Results not found"