class ObservationPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

  def create?
    user.admin? || user.observer?
  end

  def new?
    create?
  end

  def update?
    if user.present?
      user.admin? || record.user_id == user.id
    end
  end

  def edit?
    update?
  end

  def destroy?
    if user.present?
      user.admin? || record.user_id == user.id
    end
  end

  class Scope < Struct.new(:user, :scope)
    def resolve
      if user.admin?
        scope.all
      else
        scope.where(publish: true)
      end
    end
  end
end