Feature: create a admin user
  As administrator,
  So I can login as admin,
  I want to recive a user and a password

Background: empty database
  Given no user exist
  And I am on "the homepage"


Scenario: create a admin user
  When I fill in "setting_username" with "admin"
  And I press "Salvar"
  Then I should see "Username: admin"
  And I should see an admin password
  And the user "admin" exists