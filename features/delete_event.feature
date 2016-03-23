Feature: delete event
  As member,
  So ,
  I want to delete a specific event

Background: user and event has been added to database
  Given the following user exists:
  | username  | password  |
  | john      | 123456    |

  And the following event exists:
  | |||||||||

  And I am logged in as "john", "123456"
  And I am on "the events page"


Scenario: delete event
  When I follow "titulo"
  And I follow "Deletar"
  Then I should see "Evento deletado com secesso"
  And the event "titulo" does not exists