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


Scenario: delete user
  When I follow "john"
  And I follow "Deletar"
  Then I should see "Usuario deletado com secesso"
  And the user "john" does not exists