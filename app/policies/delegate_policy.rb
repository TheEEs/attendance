class DelegatePolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def update? = true 
  
  def destroy? = true 

  def create? = true

  def show? = true 
  
  def index? = true
end
