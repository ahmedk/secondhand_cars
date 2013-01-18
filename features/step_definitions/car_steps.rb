######################## Table data ######################
Given /the following makes exist/ do |makes_table|
  makes_table.hashes.each do |make|
    Make.create make
  end
end

Given /the following models exist/ do |models_table|
  models_table.hashes.each do |car_model|
    CarModel.create car_model
  end
end

Given /the following owners exist/ do |owners_table|
  owners_table.hashes.each do |owner|
    Owner.create owner
  end
end

Given /the following users exist/ do |users_table|
  users_table.hashes.each do |user|
    User.create user
  end
end

Given /the following cars exist/ do |cars_table|
  cars_table.hashes.each do |car|
    Car.create car
  end
end

######################## login steps ######################
Given /^user (.*) is logged in$/ do |id|
  owner = Owner.find(id)
  visit root_path
  fill_in "email", with: owner.email
  fill_in"password", with: "12345"
  click_button "Login"
end

When /^he submits invalid login data$/ do
  click_button "Login"
end

When /^he submits valid login data$/ do
  fill_in "email", with: Owner.first.email
  fill_in"password", with: "12345"
  click_button "Login"
end

When /^he logs out$/ do
  click_on "Logout"
end

######################## create steps #####################
When /^he submits invalid car data$/ do
  click_button "Save"
end

Then /^he should see an error message$/ do
  page.should have_selector('div.alert.alert-error')
end

When /^he submits valid car data$/ do
  select("Make1", from: "make_id")
  select("Model1", from: "car[car_model_id]")
  select("2013", from: "car[year]")
  fill_in "car[description]", with: "car description"
  fill_in "car[price]", with: 30000
  fill_in "owner[name]", with: "owner name"
  fill_in "owner[email]", with: "o.name@mail.com"
  fill_in "owner[mobile]", with: "01234567890"
  fill_in "user[password]", with: "12345"
  fill_in "user[password_confirmation]", with: "12345"
  click_button "Save"
end

Then /^he should see details page$/ do
  page.should have_content('Make1 - Model1')
end

######################## Edit steps ###########################
When /^he changes (.*) to "(.*?)"$/ do |field, value|
  fill_in field, with: value
  click_button "Save"
end

Then /^he should see "(.*)"$/ do |value|
  page.should have_content(value)
end

####################### filter steps ##########################
Given /^a user visits the (.*) page$/ do |page|
  pages = {"home" => root_path, "edit" => car_edit_path(1), "create" => car_new_path}
  visit pages[page]
end

When /^he filters (.*) with "(.*)"$/ do |field, value|
  select(value, from: field)
  click_button "Search"
end
