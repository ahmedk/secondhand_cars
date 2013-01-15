Feature: Create Car

Background: models have been added to database

  Given the following makes exist:
  | name            |
  | Make1           |
  | Make2           |
  And the following models exist:
  | name    | make_id  |
  | Model1  |    1     |
  | Model2  |    1     |
  | Model3  |    2     |
  | Model4  |    2     |

Scenario: Unsuccessful Create
  Given a user visits the create page
  When he submits invalid car data
  Then he should see an error message

@javascript
Scenario: Successful Create
  Given a user visits the create page
  When he submits valid car data
  Then he should see details page
