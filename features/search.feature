Feature: Search Car

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
  |       2      |     2    | second car | 50000 | 2000 |

Scenario: Empty Search
  Given a user visits the search page
  When he submits search criteria without a match
  Then he should see "No cars matching criteria"

Scenario: Successfull Search
  Given a user visits the search page
  When he submits search criteria
  Then he should see "car is good"
  And he should see "second car"

