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
      Then I should see 10 "tr.admin_table_row"
      And I should see the pagination

    Scenario: Create Valid Realtor
      Given I have no realtors
      And I am logged in as "admin"
      And I am on the admin list of realtors
      When I follow "New Realtor"
      And I fill in "page[title]" with "Employees"
      And I fill in "page[content]" with "<p>Our employees</p>"
      And I fill in "page[html_title]" with "Meet The Team"
      And I fill in "page[url_tag]" with "employees"
      And I fill in "page[description]" with "employees"
      And I fill in "page[keywords]" with "employees"
      And I press "Save"
      Then I should see "Realtor was successfully created."
      And I should see "Employees"
      And I should have 1 page

    Scenario: Edit Valid Realtor
      Given I have a page titled About
      And I am logged in as "admin"
      And I am on the admin list of realtors
      When I follow "Edit"
      And I fill in "page[title]" with "Employees"
      And I fill in "page[content]" with "<p>Our employees</p>"
      And I fill in "page[url_tag]" with "employees"
      And I press "Save"
      Then I should see "Realtor was successfully updated."
      And I should see "Employees"

    Scenario: Create Invalid Realtor
      Given I have no realtors
      And I am logged in as "admin"
      And I am on the admin list of realtors
      When I follow "New Realtor"
      And I fill in "page[title]" with ""
      And I fill in "page[content]" with ""
      And I fill in "page[url_tag]" with ""
      And I press "Save"
      Then I should see "errors prohibited this page"
      And I should see "Title can't be blank"
      And I should see "Content can't be blank"

    Scenario: Update a Realtor with Invalid Attributes
      Given I have a page titled About
      And I am logged in as "admin"
      And I am on the admin list of realtors
      When I follow "Edit"
      And I fill in "page[title]" with ""
      And I fill in "page[content]" with "<p>Our employees</p>"
      And I fill in "page[url_tag]" with "employees"
      And I press "Save"
      Then I should see "error prohibited this page"
      And I should see "Title can't be blank"

    Scenario: Delete a Realtor
      Given I have a page titled Un1qu3
      And I am logged in as "admin"
      And I am on the admin list of realtors
      When I follow "destroy" for the Realtor "Un1qu3"
      Then I should see "Realtor was successfully deleted."
      And I should not see "Un1qu3"

    Scenario: Default URL Tag
      Given I have no realtors
      And I am logged in as "admin"
      And I am on the admin list of realtors
      When I follow "New Realtor"
      And I fill in "page[title]" with "Employees"
      And I fill in "page[content]" with "<p>Our employees</p>"
      And I press "Save"
      Then I should see "Realtor was successfully created."
      And I should have a page with a url_tag of "employees"

    Scenario: Custom URL Tag
      Given I have no realtors
      And I am logged in as "admin"
      And I am on the admin list of realtors
      When I follow "New Realtor"
      And I fill in "page[title]" with "Employees"
      And I fill in "page[content]" with "<p>Our employees</p>"
      And I fill in "page[title]" with "our-team"
      And I press "Save"
      Then I should see "Realtor was successfully created."
      And I should have a page with a url_tag of "our-team"
