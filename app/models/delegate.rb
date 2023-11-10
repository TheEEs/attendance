class Delegate < ApplicationRecord
  has_and_belongs_to_many :conferences
  validates :name, presence: true
  validates :department, presence: true
end
