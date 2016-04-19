Feature: list user
  As member,
  So I can see my events,
  I want to list events
Background:
  Given the following user exists:
  | username  | password  |
  | john      | 123456    |
  | mary      | 123456    |

  And the following event_type exists:
  | name      |
  | Palestra  |

  And the following events exists:
  | title | summary | time | place | address | speaker | responsible | performance | event_type_id | user_id |
  | Evento 1 | a | 1 | ccsl | ime | Paul | todos     | MAC    | 1       | 1 |
  | Evento 2 | a | 0 | ccsl | ime | Vesh | todos     | MAC    | 1       | 1 |
  | Evento 3 | a | 1 | ccsl | ime | Mary | todos     | MAC    | 1       | 2 |

  And I am logged in as "john", "123456"
  And I am on "the events page"

Scenario: list only next events
  Then I should see "Evento 1"
  And I should see "Evento 3"
  And I should not see "Evento 2"

Scenario: list all events
  When I check "filter_all"
  And I press "Filtrar"
  Then I should see "Evento 1"
  And I should see "Evento 2"
  And I should see "Evento 3"

Scenario: list only my events
  When I check "filter_my"
  And I press "Filtrar"
  Then I should see "Evento 1"
  And I should not see "Evento 3"