Feature: edit event
  As user,
  So I can edit worng information about my events,
  I want to edit my events

Background: admin has been added to database 

  And the following user exists:
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

Scenario: edit event
  When I follow "Editar" in "Evento 1" line
  And I fill in the following:
  | event_title   | Evento 2                        |
  | event_summary | Alguma coisa muito importante   |
  And I press "Submeter"
  Then I should see "Evento atualizado com sucesso."
  And I should see "Evento 2"
  And I should see "Alguma coisa muito importante"

Scenario: edit event with empty fields
  When I follow "Editar" in "Evento 1" line
  When I fill in the following:
  | event_title         |  |
  And I press "Submeter"
  Then I should not see "Evento atualizado com sucesso"
