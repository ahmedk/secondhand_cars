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
  And the following cars exist:
  | car_model_id | owner_id | description | price | year |
  |       1      |     1    | car is good | 50000 | 2000 |

Scenario: No match filter
  Given a user visits the home page
  When he filters year with "1999"
  Then he should see "No cars available"

Scenario: Matching filter
  Given a user visits the home page
  When he filters year with "2000"
  Then he should see "car is good"
