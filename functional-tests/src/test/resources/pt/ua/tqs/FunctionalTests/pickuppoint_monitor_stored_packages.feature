Feature: Monitor stored packages

  Scenario: Pick-up Point monitors stored packages
    Given I am on the 'http://localhost:5173’ website
    And I am already logged in as Pick-up Point
    When I click on ‘Stored Packages’ in the navbar
    Then I should be redirected to a new page with the title ‘Stored packages’
