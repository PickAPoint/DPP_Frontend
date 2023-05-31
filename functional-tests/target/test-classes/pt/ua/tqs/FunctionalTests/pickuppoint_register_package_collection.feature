Scenario: Pick-up Point registers received package
  Given I am on the ‘http://localhost:5173’ website
  And I am already logged in as a Pick-up Point
  When I click on ‘Register Package’ button
  Then I should see a modal with the title ‘Register New Package’
  When I enter the package ID ‘1234’
  And I click on ‘Register’ button
  Then I should see the warning ‘Are you sure you want to register the package 1234?'
  When I click on ‘Yes, I’m sure'
  Then I should see the package '1234' in the Stored Packages table
