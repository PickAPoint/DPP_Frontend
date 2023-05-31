Feature: Get historical air quality data for a given city
  Scenario: Successful retrieval of air quality
    When I navigate to the "Historical" page
    And I select "Aveiro" as the target city
    And I select "01/03/2022" as the start date
    And I select "07/03/2022" as the end date
    And I click on the retrieve button
    Then I should see a table with the results

  Scenario: Unsuccessful retrieval of air quality
    When I navigate to the "Historical" page
    When I select "xpto" as the target city
    And I click on the retrieve button
    Then I should see a message "Results not found"