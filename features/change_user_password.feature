Feature: change user password
  As admin,
  So others people can change their passwords,
  I want to change their passwords

Background: admin has been added to database
  Given the following admin exists:
  | username  | password  |
  | admin     | 123456    |  

  And the following user exists:
  | username  | password  |
  | john      | 123456    |

  And I am logged in as "admin", "123456"
  And I am on "the users page"

Scenario: change user password
  When I follow "Editar" in "john" line
  And I fill in the following:
  | user_password              | 654321         |
  | user_password_confirmation | 654321         |
  And I press "Submeter"
  Then I should see "Usuario atualizado com sucesso."
  And the user "john" has the password "123456"

Scenario: change user password with mismatching password
  When I follow "Editar" in "john" line
  When I fill in the following:
  | user_password              | 654321           |
  | user_password_confirmation | 654322           |
  And I press "Submeter"
  Then I should not see "Usuario atualizado com sucesso."