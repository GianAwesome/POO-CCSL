Feature: delete user
  As admin,
  So a member cannot create new events,
  I want to delete a specific user

Background: user has been added to database
  Given the following admin exists:
  | username  | password  |
  | admin     | 123456    |

  And the following user exists:
  | username  | password  |
  | john      | 123456    |

  And I am logged in as "admin", "123456"
  And I am on "the users page"

@javascript
Scenario: delete user
  When I delete the user with the name "john"
  Then I should see "john deletado com sucesso."
  And the user "john" does not exists

@javascript
Scenario: delete last admin
  When I delete the user with the name "admin"
  Then I should not see "admin deletado com sucesso."
  And the user "admin" exists