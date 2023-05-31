Feature: Check cache statistics
  Scenario: Successful retrieval of cache statistics
    When I navigate to the "Cache" page
    Then I should see a graphic
    And I should see a text line with "Hits"
    And I should see a text line with "Misses"