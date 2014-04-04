require 'spec_helper'

feature 'owner is associated with a building', %Q{
  As a real estate associate
  I want to correlate an owner with buildings
  So that I can refer back to pertinent information
} do

#ACCEPTANCE CRITERIA
#When recording a building, I want to optionally associate the building with its rightful owner.
#If I delete an owner, the owner and its primary key should no longer be associated with any properties.

scenario 'user correlates owner when submitting new building' do
  owner = FactoryGirl.create(:owner)
  building_count = Building.count


  visit root_path
  click_on 'Add New Building'
  fill_in 'Street address', with: "101 launch st"
  fill_in 'City', with: 'Beantown'
  fill_in 'State', with: 'Massachusetts'
  fill_in 'Postal code', with: '02446'
  select("#{owner.full_name}", from: "Owner")
  click_on 'Create New Building'

  expect(Building.count).to eql(building_count + 1)
  expect(owner.buildings.count).to eql(1)
end

scenario 'user deletes an owner and all associated buildings are deleted' do

  owner = FactoryGirl.create(:owner)
  building1 = FactoryGirl.create(:building, owner_id: owner.id)
  building2 = FactoryGirl.create(:building, owner_id: owner.id)
  owner.destroy

  expect(Building.count).to eql(0)
end

end
