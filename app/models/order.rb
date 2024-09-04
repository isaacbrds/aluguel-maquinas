class Order < ApplicationRecord
  belongs_to :customer
  belongs_to :equipament

  has_one :schedule

  
  after_create :generate_schedule
  validates :period_start , presence: true

  private

  def generate_schedule
    schedule = build_schedule(
      equipament: equipament,
      period_start: period_start,
      period_end: period_end || Date.new(2099, 12, 31)
    )

    schedule.save!
  end
end
