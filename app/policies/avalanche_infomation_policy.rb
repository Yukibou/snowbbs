class AvalancheInfomationPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

  def create?
    if user.present?
      user.admin?
    else
      false
    end
  end

  def new?
    create?
  end

  def update?
    if user.present?
      user.admin?
    end
  end

  def edit?
    update?
  end

  def destroy?
    if user.present?
      user.admin?
    end
  end

  class Scope < Struct.new(:user, :scope)
    def resolve
      scope.all
    end
  end
end