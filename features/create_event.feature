Feature: create an event
  As member,
  So I can publish an event,
  I want to create a new event to the system

Background: user has been added to database
  Given the following user exists:
  | username  | password  |
  | john      | 123456    |

  And I am logged in as "john", "123456"
  And I am on "new event page"


Scenario: create an event
  When I fill in the following:
  | title         |
  | summary       |
  | time          |
  | date          |
  | place         |
  | address       |
  | speaker       |
  | responsible   |
  | performance   |
  | url           |
  | type          |
  And I press "Criar"
  Then I should see "Evento criado com sucesso"
  And I should see "Titulo do evento"
  And the event "Titulo do evento" exists