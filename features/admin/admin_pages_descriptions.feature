@admin-pages
Feature: Manage Pages
    In order to make CMS website
    As an admin
    I want to create and manage pages
    
    Scenario: Page List
      Given there are 3 pages
      And I am logged in as "admin"
      When I go to the admin list of pages
      Then I should see 3 "tr.admin_table_row"

    Scenario: Page List Pagination
      Given there are 20 pages
      And I am logged in as "admin"
      When I go to the admin list of pages
      Then I should see 10 "tr.admin_table_row"
      And I should see the pagination

    Scenario: Create Valid Page
      Given I have no pages
      And I am logged in as "admin"
      And I am on the admin list of pages
      When I follow "New Page"
      And I fill in "page[title]" with "Employees"
      And I fill in "page[content]" with "<p>Our employees</p>"
      And I fill in "page[html_title]" with "Meet The Team"
      And I fill in "page[url_tag]" with "employees"
      And I fill in "page[description]" with "employees"
      And I fill in "page[keywords]" with "employees"
      And I press "Save"
      Then I should see "Page was successfully created."
      And I should see "Employees"
      And I should have 1 page

    Scenario: Edit Valid Page
      Given I have a page titled About
      And I am logged in as "admin"
      And I am on the admin list of pages
      When I follow "Edit"
      And I fill in "page[title]" with "Employees"
      And I fill in "page[content]" with "<p>Our employees</p>"
      And I fill in "page[url_tag]" with "employees"
      And I press "Save"
      Then I should see "Page was successfully updated."
      And I should see "Employees"

    Scenario: Create Invalid Page
      Given I have no pages
      And I am logged in as "admin"
      And I am on the admin list of pages
      When I follow "New Page"
      And I fill in "page[title]" with ""
      And I fill in "page[content]" with ""
      And I fill in "page[url_tag]" with ""
      And I press "Save"
      Then I should see "errors prohibited this page"
      And I should see "Title can't be blank"
      And I should see "Content can't be blank"

    Scenario: Update a Page with Invalid Attributes
      Given I have a page titled About
      And I am logged in as "admin"
      And I am on the admin list of pages
      When I follow "Edit"
      And I fill in "page[title]" with ""
      And I fill in "page[content]" with "<p>Our employees</p>"
      And I fill in "page[url_tag]" with "employees"
      And I press "Save"
      Then I should see "error prohibited this page"
      And I should see "Title can't be blank"

    Scenario: Delete a Page
      Given I have a page titled Un1qu3
      And I am logged in as "admin"
      And I am on the admin list of pages
      When I follow "destroy" for the Page "un1qu3"
      Then I should see "Page was successfully deleted."
      And I should not see "Un1qu3"
      
    Scenario: Default URL Tag
      Given I have no pages
      And I am logged in as "admin"
      And I am on the admin list of pages
      When I follow "New Page"
      And I fill in "page[title]" with "Employees"
      And I fill in "page[content]" with "<p>Our employees</p>"
      And I press "Save"
      Then I should see "Page was successfully created."
      And I should have a page with a url_tag of "employees"

    Scenario: Custom URL Tag
      Given I have no pages
      And I am logged in as "admin"
      And I am on the admin list of pages
      When I follow "New Page"
      And I fill in "page[title]" with "Employees"
      And I fill in "page[content]" with "<p>Our employees</p>"
      And I fill in "page[title]" with "our-team"
      And I press "Save"
      Then I should see "Page was successfully created."
      And I should have a page with a url_tag of "our-team"
