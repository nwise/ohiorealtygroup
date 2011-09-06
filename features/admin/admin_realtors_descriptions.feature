@admin-realtors
Feature: Manage Realtors
    In order to make a realtor listing
    As an admin
    I want to create and manage realtors

    Scenario: Realtor List
      Given there are 3 realtors
      And I am logged in as "admin"
      When I go to the admin list of realtors
      Then I should see 3 "tr.admin_table_row"

    Scenario: Realtor List Pagination
      Given there are 20 realtors
      And I am logged in as "admin"
      When I go to the admin list of realtors
      Then I should see 20 "tr.admin_table_row"

    Scenario: Create Valid Realtor
      Given I have no realtors
      And I am logged in as "admin"
      And I am on the admin list of realtors
      When I follow "New Realtor"
      And I fill in "realtor[name]" with "Phil"
      And I fill in "realtor[phone_number]" with "123.456.7890"
      And I fill in "realtor[cell_number]" with "456.789.0123"
      And I fill in "realtor[voicemail_number]" with "111.111.1111"
      And I fill in "realtor[email]" with "phil@ohiorealtygroup.com"
      And I fill in "realtor[website]" with "http://www.ohiorealtygroup.com"
      And I fill in "realtor[bio_link]" with "http://www.ohiorealtygroup.com/realtors/phil"
      And I fill in "realtor[url_tag]" with "phil-march"
      And I press "Save"
      Then I should see "Realtor was successfully created."
      And I should see "Realtor Listing"
      And I should have 1 realtor

    Scenario: Edit Valid Realtor
      Given I have a realtor named Phil
      And I am logged in as "admin"
      And I am on the admin list of realtors
      When I follow "Edit"
      And I fill in "realtor[name]" with "Phillip"
      And I fill in "realtor[phone_number]" with "123.456.7890"
      And I fill in "realtor[url_tag]" with "phillip-march"
      And I press "Save"
      Then I should see "Realtor was successfully updated."
      And I should see "Realtor Listing"
      And I should see "Phillip"

     Scenario: Delete a Realtor
      Given I have a realtor named Phil
      And I am logged in as "admin"
      And I am on the admin list of realtors
      When I follow "destroy" for the Realtor "Phil"
      Then I should see "Realtor was successfully deleted."
      And I should not see "Phil"
