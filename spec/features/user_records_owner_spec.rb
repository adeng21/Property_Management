require 'spec_helper'

feature 'user records owner', %Q{
  As a real estate associate
  I want to record a building owner
  So that I can keep track of our relationships with owners
} do

#ACCEPTANCE CRITERIA
# I must specify a first name, last name, and email address
# I can optionally specify a company name
# If I do not specify the required information, I am presented with errors
# If I specify the required information, the owner is recorded and I am redirected to enter another new owner

before :each do
  visit root_path
  click_on 'Add New Owner'
end

scenario 'user submits required information and creates a new owner' do

  count = Owner.count
  fill_in 'First name', with: 'Boss'
  fill_in 'Last name', with: 'Man'
  fill_in 'Email', with: 'boss@man.com'
  fill_in 'Company', with: ''
  click_on 'Create New Owner'

  expect(page).to have_content("New Owner Successfully Created!")
  expect(current_path).to eql(root_path)
  expect(Owner.count).to eql(count + 1)

end

scenario 'user does not submit required information and no owner is created' do

  count = Owner.count
  fill_in 'First name', with: ''
  fill_in 'Last name', with: ''
  fill_in 'Email', with: ''
  fill_in 'Company', with: ''
  click_on 'Create New Owner'

  expect(page).to have_content("Can't be blank")
  expect(Owner.count).to eql(count)
end



end
