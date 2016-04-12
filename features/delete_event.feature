Feature: delete event
  As member, I want to delete a invalid event
  So others people cannot see the invalid event,
  I want to delete a specific event

Background: user and event has been added to database
  Given the following user exists:
  | username  | password  |
  | john      | 123456    |

  And the following event_type exists:
  | name      |
  | Palestra  |

  And the following events exists:
  | title | summary | time | place | address | speaker | responsible | performance | event_type_id | user |
  | Evento | a | 2056-04-26 08:00:00 | ccsl | ime | Barreira | todos     | MAC    | 1       | john  |

  And I am logged in as "john", "123456"
  And I am on "the events page"

@javascript
Scenario: delete event
  When I follow "Apagar" in "Evento" line
  And I confirm the dialog
  Then I should see "Evento apagado"
  And the event "Evento" does not exists