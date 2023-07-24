class TenantPolicy < ApplicationPolicy
  attr_reader :user
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end


  def index?
    @user.has_role? :superadmin
  end
end
