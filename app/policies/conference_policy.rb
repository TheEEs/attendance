class ConferencePolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.where(user: user)
    end
  end

  attr :user, :conference

  def initialize(user, conference)
    @user = user
    @conference = conference
  end

  def index? = true

  def show? = true

  def update? = true

  def create? = true

  def destroy? = true
end
