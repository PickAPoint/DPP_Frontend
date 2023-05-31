Feature: Administrator Login

  Scenario: Administrator logs in with valid credentials
    Given I am on the 'http://localhost:5173' website
    When I click on 'Login' button
    Then I should enter 'Login' Page
    And The page title 'Sign in to our platform'
    When I enter 'admin@pap.com' as the email
    And I enter 'admin' as the password
    Then I should be redirected to a new page with title 'Administrator'

  Scenario: Administrator logs in with invalid email
    Given I am on the 'http://localhost:5173 website
    When I click on ‘Login’
    Then I should be redirected to a new page with title ‘Sign in to our platform’
    When I enter ‘aaa@ua.com’ as the email
    And I enter ‘admin’ as the password
    Then I should see the error message ‘Error! Invalid credentials or account waiting for approval.’

  Scenario: Administrator logs in with invalid password
    Given I am on the 'http://localhost:5173 website
    When I click on ‘Login’
    Then I should be redirected to a new page with title ‘Sign in to our platform’
    When I enter ‘admin@ua.com’ as the email
    And I enter ‘aaa’ as the password
    Then I should see the error message ‘Error! Invalid credentials or account waiting for approval.’
