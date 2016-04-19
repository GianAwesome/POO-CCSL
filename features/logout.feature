Feature: logout the aplication
  As a user,
  So other people can't use my account
  I want to logout the aplication

Background: users exist in the database and loged in

  Given the following user exists:
  | username  | password  |
  | john      | 123456    |

  And I am logged in as "john", "123456"
  And I am on "the homepage"
Scenario: logout
  When I follow "Sair"
  Then I should see "Entrar"
  And I should see "Novo usuario? Contate um administrador para se cadastrar! "
