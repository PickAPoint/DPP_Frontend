Feature: Monitor forgotten packages

  Scenario: Pick-up Point monitors forgotten packages
    Given I am on the 'http://localhost:5173’ website
    And I am already logged in as Pick-up Point
    When I click on ‘Forgotten Packages’ in the navbar
    Then I should be redirected to a new page with the title ‘Forgotten packages’
