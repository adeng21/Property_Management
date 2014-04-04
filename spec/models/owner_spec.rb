require 'spec_helper'



describe Owner do

  it{should validate_presence_of(:first_name)}
  it{should validate_presence_of(:last_name)}
  it{should validate_presence_of(:email)}

  it 'should have a unique email' do
    FactoryGirl.create(:owner)
    should validate_uniqueness_of(:email)
  end

end
