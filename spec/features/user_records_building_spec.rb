require 'spec_helper'

feature 'user records building', %Q{
  As a real estate associate
  I want to record a building
  So that I can refer back to pertinent information
} do

#ACCEPTANCE CRITERIA
# I must specify a street address, city, state, and postal code
# Only US states can be specified
# I can optionally specify a description of the building
# If I enter all of the required information in the required format, the building is recorded.
# If I do not specify all of the required information in the required formats, the building is not recorded and I am presented with errors
# Upon successfully creating a building, I am redirected so that I can record another building.

before :each do
  visit root_path
  click_on 'Add New Building'
end

scenario 'user inputs valid information and records a building' do

  count = Building.count
  fill_in 'Street address', with: '101 launch st'
  fill_in 'City', with: 'Beantown'
  fill_in 'State', with: 'Massachusetts'
  fill_in 'Postal code', with: '02446'
  fill_in 'Description', with: ''
  click_on 'Create New Building'

  expect(page).to have_content("New Building Successfully Created!")
  expect(current_path).to eql(root_path)
  expect(Building.count).to eql(count + 1)

end

scenario 'user does not input valid information and a building is not recorded' do

  count = Building.count
  fill_in 'Street address', with: '101 launch st'
  fill_in 'City', with: 'Beantown'
  fill_in 'State', with: 'Massachusetts'
  fill_in 'Postal code', with: ''
  fill_in 'Description', with: ''
  click_on 'Create New Building'

  expect(page).to have_content("Can't be blank")
  expect(Building.count).to eql(count)
end

end
