Feature: Check packages status

  Scenario: Administrator checks packages status
    Given I am on the 'http://localhost:5173’ website
    And I am already logged in as Administrator
    When I click on ‘Packages’ button
    Then I should be redirected to a new page with the title ‘Packages’