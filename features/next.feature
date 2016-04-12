Feature: See the next upcoming event
	As a visitor, 
	So I can choose wheter I go or not to the next upcoming event
	I want to see the next upcomig event

Background: some events added to the database
	Given the following events exists:
	| title | summary | time | place | address | speaker | responsible | performance | event_type_id |
	| Evento 1 | a | 2016-04-26 08:00:00 | ccsl | ime | Barreira | todos     | MAC 		| 1 			| 
	| Evento 2 | a | 2016-04-26 06:00:00 | ccsl | ime | Barreira | todos     | MAC 		| 1 			| 
	| Evento 3 | a | 2016-04-28 08:00:00 | ccsl | ime | Barreira | todos     | MAC 		| 1 			| 
	| Evento 4 | a | 2016-04-28 10:00:00 | ccsl | ime | Barreira | todos     | MAC 		| 1 			| 
	| Evento 5 | a | 2016-04-29 08:00:00 | ccsl | ime | Barreira | todos     | MAC 		| 1 			| 

	Given the following admin exists:
  	| username  | password  |
  	| admin     | 123456    |  

  	And I am logged in as "admin", "123456"
  	And I am on "the next page"

Scenario: see next event
  	I should see "Evento 2"

