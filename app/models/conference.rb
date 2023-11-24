class Conference < ApplicationRecord
  include Hashid::Rails
  
  has_many :attends, dependent: :destroy
  has_many :delegates, through: :attends, inverse_of: :conferences
  validates :name, presence: true
  validates :start_when, presence: true
  belongs_to :user, inverse_of: :conferences

  def number_of_delegates
    delegates.count
  end
end
