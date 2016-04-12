Feature: update event
  As a member,
  So I can fix a wrong information about an event,
  I want to update a specific event

Background: user and event has been added to database
  Given the following user exists:
  | username  | password  |
  | john      | 123456    |

  And the following event_type exists:
  | name      |
  | Palestra  |

  And the following events exists:
  | title | summary | time | place | address | speaker | responsible | performance | event_type_id | user_id |
  | Evento 1 | a | 2016-04-26 08:00:00 | ccsl | ime | Barreira | todos     | MAC    | 1       | 1 |

  And I am logged in as "john", "123456"
  And I am on "the events page"

Scenario: update event
  When I follow "Editar" in "Evento" line
  And I fill in the following:
  | event_speaker       | Bernardo      |
  And I press "Submeter"
  Then I should see "Evento atualizado com sucesso"
  And I should see "Bernardo"