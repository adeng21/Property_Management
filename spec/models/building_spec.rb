require 'spec_helper'

describe Building do
  it{should validate_presence_of(:street_address)}
  it{should validate_presence_of(:city)}
  it{should validate_presence_of(:state)}
  it{should validate_presence_of(:postal_code)}

  it 'belongs to an owner' do
    owner = FactoryGirl.create(:owner)
    building = FactoryGirl.create(:building, owner_id: owner.id)

    expect(building.owner).to eql(owner)
  end
end
