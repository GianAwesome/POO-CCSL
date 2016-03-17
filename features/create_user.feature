Feature: create user
  As admin,
  So others people can create new events,
  I want to create a new user

Background: admin has been added to database
  Given the following admin exists:
  | username  | password  |
  | admin     | 123456    |  

  And I am logged in as "admin", "123456"
  And I am on the "new user page"


Scenario: create a new user
  When I fill in "Username" with "john"
  And I fill in "Senha" with "654321"
  And I press "Criar"
  Then I should see "Usuario john criado com sucesso"
  And the user "john" exists