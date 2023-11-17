class Conference < ApplicationRecord
  has_many :attends,dependent: :destroy
  has_many :delegates, through: :attends, inverse_of: :conferences
  validates :name, presence: true
  validates :start_when, presence: true


  def number_of_delegates
    delegates.count
  end
end
