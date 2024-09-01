class Equipament < ApplicationRecord
  validates :name, :serial_number, presence: true
  has_rich_text :description
end
