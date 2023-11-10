class Conference < ApplicationRecord
  has_and_belongs_to_many :delegates
  validates :name, presence: true
  validates :start_when, presence: true


  def number_of_delegates
    delegates.count
  end
end
