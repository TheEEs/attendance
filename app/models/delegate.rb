class Delegate < ApplicationRecord
  has_many :attends
  has_many :conferences, :through => :attends, inverse_of: :delegates
  validates :name, presence: true
  validates :department, presence: true
end
