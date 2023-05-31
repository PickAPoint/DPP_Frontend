Feature: Pick-up Point Login

  Scenario: Pick-up Point logs in with valid credentials
    Given I am on the 'http://localhost:5173 website
    When I click on ‘Login’ button
    Then I should be redirected to a new page with title ‘Sign in to our platform’
    When I enter ‘acptest@ua.pt’ as the email
    And I enter ‘test’ as the password
    And I click on ‘Login to your account’ button
    Then I should be redirected to a new page with title ‘Pick-up Point'

  Scenario: Pick-up Point logs in with invalid email
    Given I am on the 'http://localhost:5173 website
    When I click on ‘Login’
    Then I should be redirected to a new page with title ‘Sign in to our platform’
    When I enter ‘admin@pap.com’ as the email
    And I enter ‘test’ as the password
    Then I should see the error message ‘Error! Invalid credentials or account waiting for approval.’

  Scenario: Pick-up Point logs in with invalid password
    Given I am on the 'http://localhost:5173 website
    When I click on ‘Login’
    Then I should be redirected to a new page with title ‘Sign in to our platform’
    When I enter ‘admin@pap.com’ as the email
    And I enter ‘aaa’ as the password
    Then I should see the error message ‘Error! Invalid credentials or account waiting for approval.’
