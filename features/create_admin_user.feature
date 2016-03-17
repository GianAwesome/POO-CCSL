Feature: create a admin user
  As administrator,
  So I can login as admin,
  I want to recive a user and a password

Background: empty database
  Given no user exist
  And I am on "homepage"


Scenario: create a admin user
  Then I should see "user: admin"
  And I should see an admin password
  And the user "admin" exists