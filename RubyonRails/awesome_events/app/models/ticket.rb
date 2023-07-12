class Ticket < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :event
  
  validates :commnet, length: { maximum: 30 }, allow_blank: true
end
