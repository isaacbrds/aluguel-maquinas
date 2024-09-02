class Customer < ApplicationRecord
  validates :name, presence: true
  validates :dob, presence: true
  validates :mobile_phone, presence: true

  def self.ransackable_attributes(auth_object=nil)
    ["name"]
  end
end
