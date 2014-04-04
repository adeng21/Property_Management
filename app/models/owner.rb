class Owner < ActiveRecord::Base

  has_many :buildings,
    inverse_of: :owner,
    dependent: :destroy

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: {case_sensitive: false}

def full_name
  "#{self.first_name} #{self.last_name}"

end

end
