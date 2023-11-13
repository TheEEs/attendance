class ConferencePolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def show? = true

  def update? = true 
  
  def create? = true

  def index? = true

  def destroy? = true
end
