class Delegate < ApplicationRecord
  has_many :attends, dependent: :destroy
  has_many :conferences, :through => :attends, inverse_of: :delegates
  #validates :name, presence: true
  validates :department, presence: true

  def display_title
    delegate = self
    if delegate.name
      "#{delegate.name} - #{delegate.department}"
    else
      delegate.department
    end
  end
end
