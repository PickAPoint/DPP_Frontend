Feature: Register business as a Pick-up Point

  Scenario: Register as a Pick-up Point with valid email
    Given I am on the 'http://localhost:5173/' website
    When I click on ‘Be a Partner’
    Then I should be redirected to a new page with title ‘Become a Pick-up Point’
    When I enter ‘acptest@ua.pt’ as the email
    And I enter ‘test’ as the password
    And I enter ‘Novo ACP’ as the Company Name
    And I enter ‘9100000000’ as the Company Contact
    And I enter ‘40.631401’ as latitude
    And I enter ‘-8.658239’ as longitude
    And I press the ‘Send Request’ button
    Then I should be redirected to a new page with the title 'Thank you for your application, we will review it and get back to you through email as soon as possible '

  Scenario: Register as a Pick-up Point with invalid or already in use fields
    Given the following ACP accounts
      |Email	|Password	|Company Name	|Company Contact	|Latitude	|Longitude	|
      |testacp@ua.pt	|teste	|ACP1	|910000000	|40.631401	|-8.658239	|

    And I am on the 'http://localhost:5173/' website
    When I click on ‘Be a Partner’ button
    Then I should be redirected to a new page with title ‘Business Information’
    When I enter ‘testacp@ua.pt’ as the email
    And I enter ‘test’ as the password
    And I enter ‘Novo ACP’ as the Company Name
    And I enter ‘9100000000’ as the Company Contact
    And I enter ‘40.631401’ as latitude
    And I enter ‘-8.658239’ as longitude
    And I press the Send Request button
    Then a message containing ‘Error ‘ should be displayed
