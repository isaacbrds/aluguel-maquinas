class Schedule < ApplicationRecord
  enum status: { pending: 'pending', in_progress: 'in_progress', done: 'done' }
  
  belongs_to :equipament
  
  validates :status, :period_start, presence:true 
end
