Feature: Register new package

  Scenario: Pick-up Point registers received package
    Given I am on the 'http://localhost:5173’ website
    And I am already logged in as a Pick-up Point
    When I click on ‘Register Package’ button
    Then I should see the title ‘Package ID’
    When I enter the code ‘1234’
    And I click on ‘Register’ button
    Then I should see the message ‘Package registered with success’ in a modal
