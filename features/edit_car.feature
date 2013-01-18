Feature: Edit Car

Background: a car added to db

  Given the following makes exist:
  | name  |
  | Make1 |
  | Make2 |
  And the following models exist:
  | name   | make_id  |
  | Model1 |    1     |
  | Model2 |    1     |
  | Model3 |    2     |
  | Model4 |    2     |
  And the following owners exist:
  | name |   email   |   mobile    |
  |  a   | a.b@c.com | 01234567890 |
  |  d   | d.e@f.net | 01209876543 |
  And the following users exist:
  | owner_id | password | password_confirmation |
  |     1    |  12345   |         12345         |
  |     2    |  12345   |         12345         |
  And the following cars exist:
  | car_model_id | owner_id | description | price | year |
  |       1      |     1    | car is good | 50000 | 2000 |

Scenario: Unsuccessful Edit; not logged in
  Given a user visits the edit page
  Then he should see "Don't have access to car"

Scenario: Unsuccessful Edit; incorrect customer
  Given user 2 is logged in
  And a user visits the edit page
  Then he should see "Don't have access to car"

Scenario: Unsuccessful Edit; invalid data
  Given user 1 is logged in
  And a user visits the edit page
  When he changes car[description] to ""
  Then he should see an error message

Scenario: Successful Edit
  Given user 1 is logged in
  And a user visits the edit page
  When he changes car[description] to "wait for it"
  Then he should see details page
  And he should see "wait for it"
