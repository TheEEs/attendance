class AttendPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  attr :user, :attend

  def initialize(user, attend)
    @user = user
    @attend = attend
  end

  def destroy? = true
end
