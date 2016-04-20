Feature: log in
  As user,
  So I can manage events,
  I want to log in in the system

Background: user has been added to database
  Given the following user exist:
  | username  | password  |
  | john      | 12345678  |

  And I am on "the login page"


Scenario: log in in the system
  When I fill in "Username" with "john"
  And I fill in "Senha" with "12345678"
  And I check "remember_me"
  And I press "Entrar"
  Then I should see "Lista de eventos"
  And I should see "Novo Evento"

Scenario: fail log in
  When I fill in "Username" with "john"
  And I fill in "Senha" with "123456789"
  And I press "Entrar"
  Then I should see "Username ou senha invalidos"