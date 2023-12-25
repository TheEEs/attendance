class Delegate < ApplicationRecord
  has_many :attends, dependent: :destroy
  has_many :conferences, :through => :attends, inverse_of: :delegates
  # validates :name, presence: true
  validates :department, presence: true

  def display_title
    delegate = self
    if delegate.name
      "#{delegate.name} - #{delegate.department}"
    else
      delegate.department
    end
  end

  # def self.sort_field = :name
  def self.sort_expression
    @t ||= self.arel_table
    @expression ||= Arel::Nodes::NamedFunction.new("TRIM", [
                                                     Arel::Nodes::NamedFunction.new("CONCAT", [@t[:name], @t[:department]])
                                                   ])
  end
end
