Feature: log in
  As user,
  So I can manage events,
  I want to log in in the system

Background: user has been added to database
  Given the following user exist:
  | username  | password  |
  | john      | 12345678  |

  And I am on login page


Scenario: log in in the system
  When I fill in "Username" with "john"
  And I fill in "Senha" with "12345678"
  Then I should see "Meus eventos"
  And I should see "Criar evento"