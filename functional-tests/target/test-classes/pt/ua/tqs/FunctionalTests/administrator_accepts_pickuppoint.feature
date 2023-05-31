Feature: Accept Pick-up Point join request

  Scenario: Administrator accepts Pick-up Point Pick-up Point join request
    Given I am on the 'http://localhost:5173’ website
    And I am already logged in as Administrator
    And I have a new Pick-up Point join request
    When I click on ‘Pick-up Points’ button
    Then I should be redirected to a new page with the title ‘Pick-up Points’
    When I click on ‘Accept Pick-up Point’
    Then I should see the message ‘Pick-up Point joined with success’ in a modal
