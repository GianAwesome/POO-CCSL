Feature: create an event
  As member,
  So I can publish an event,
  I want to create a new event to the system

Background: user and event_type have been added to database
  Given the following user exists:
  | username  | password  |
  | john      | 123456    |

  And I am logged in as "john", "123456"
  And the following event_type exists:
  | name      |
  | Palestra  |
  And I am on "the new event page"


Scenario: create an event
  When I fill in the following:
  | event_title         | Nova Reunião  |
  | event_summary       | Asd Reunião   |
  | event_place         | Aqui          |
  | event_address       | Av. Here 76   |
  | event_speaker       | Eu            |
  | event_responsible   | Vc            |
  | event_performance   | Alguém        |
  | event_url           | www.site.com  |
  And I select "Palestra" from "event_event_type_id"
  And I select "April 04, 2016 14:30" as the date from "event_time"
  And I press "Submeter"
  Then I should see "Evento criado com sucesso"
  And the event_type "Palestra" exists
  And I should see "Nova Reunião"
  And I should see "Asd Reunião"
  And I should see "Aqui"
  And I should see "Av. Here 76"
  And I should see "Eu"
  And I should see "Vc"
  And I should see "Alguém"
  And I should see "www.site.com"
  And I should see "Palestra"
  And I should see "04/04/2016"
  And I should see "14:30"
  And the event "Nova Reunião" exists

Scenario: create event with empty fields
  When I press "Submeter"
  Then I should not see "Evento criado com sucesso"