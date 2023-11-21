class ConferencePolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def index? = true

  def show? = true

  def update? = true

  def create? = true

  def destroy? = true
end
