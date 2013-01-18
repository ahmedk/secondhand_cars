Feature: Authentication

Background: users added to db

  Given the following owners exist:
  | name |   email   |   mobile    |
  |  a   | a.b@c.com | 01234567890 |
  And the following users exist:
  | owner_id | password | password_confirmation |
  |     1    |  12345   |         12345         |

Scenario: Unsuccessful login
  Given a user visits the home page
  When he submits invalid login data
  Then he should see "Wrong email or password"

Scenario: Successful login
  Given a user visits the home page
  When he submits valid login data
  Then he should see "Login successful"

Scenario: Logout
  Given user 1 is logged in
  And a user visits the home page
  When he logs out
  Then he should see "Logout successful"
