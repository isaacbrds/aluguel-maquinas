class Schedule < ApplicationRecord
  enum status: { pending: 'pending', in_progress: 'in_progress', done: 'done' }
  
  belongs_to :equipament
  belongs_to :order, optional: true
  
  validates :status, :period_start, presence:true 
end
