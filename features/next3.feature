Feature: See the next 3 upcoming events
	As a visitor, 
	So I can choose to which event I'm going
	I want to see the next 3 upcomig events

Background: some events added to the database
	Given the following events exists:
	| title | summary | time | place | address | speaker | responsible | performance | event_type_id |
	| Evento 1 | a | 2016-04-26 08:00:00 | ccsl | ime | Barreira | todos     | MAC    | 1       | 
  	| Evento 2 | a | 2016-04-26 06:00:00 | ccsl | ime | Barreira | todos     | MAC    | 1       | 
  	| Evento 3 | a | 2016-04-28 08:00:00 | ccsl | ime | Barreira | todos     | MAC    | 1       | 
  	| Evento 4 | a | 2016-04-28 10:00:00 | ccsl | ime | Barreira | todos     | MAC    | 1       | 
  	| Evento 5 | a | 2016-04-29 08:00:00 | ccsl | ime | Barreira | todos     | MAC    | 1       | 

	Given the following admin exists:
  	| username  | password  |
  	| admin     | 123456    |  

  	And I am logged in as "admin", "123456"
  	And I am on "the next3 page"

Scenario: see next event
  	And I should see "Próximos Eventos"
  	And I should see "Evento 2"
  	And I should see "Evento 1"
  	And I should see "Evento 3"
