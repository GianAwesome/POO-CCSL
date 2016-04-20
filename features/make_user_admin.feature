Feature: make user admin
  As admin,
  So others people can administer the system,
  I want to make an user admin

Background: admin has been added to database
  Given the following admin exists:
  | username  | password  |
  | admin     | 123456    |  

  And the following user exists:
  | username  | password  |
  | john      | 123456    |

  And I am logged in as "admin", "123456"
  And I am on "the users page"

@javascript
Scenario: make an user admin
  When I make admin the user with the name "john"
  Then I should see "Usuario atualizado com sucesso."
  And the user "john" is admin

@javascript
Scenario: fail admin to user
  When I make user the admin with the name "admin"
  Then I should see "O sistema deve ter no minimo um administrador"
  And the user "john" is not admin