Feature: create an event
  As member,
  So I can publish an event,
  I want to create a new event to the system

Background: user has been added to database
  Given the following user exists:
  | username  | password  |
  | john      | 123456    |

  And I am logged in as "john", "123456"
  And I am on "the new event page"


Scenario: create an event
  When I fill in the following:
  | event_title         | Nova Reunião  |
  | event_summary       | Asdasd        |
  | event_place         | Aqui          |
  | event_address       | Av. Aqui 76   |
  | event_speaker       | Eu            |
  | event_responsible   | Vc            |
  | event_performance   | Alguém        |
  | event_url           | www.site.com  |
  | event_event_type_id | Palestra      |
  And I select "April 04, 2016" as the event "date" date
  And I press "Criar Evento"
  Then I should see "Evento criado com sucesso"
  And I should see "Nova Reunião"
  And the event "Nova Reunião" exists