class ObservationPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

  def create?
    if user.present?
      user.admin? || user.observer?
    else
      false
    end
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

  def public_user?
    user.blank? || user.undefine?
  end

  class Scope < Struct.new(:user, :scope)
    def resolve
      if user.present? && user.admin?
        scope.all
      elsif user.present? && user.observer?
        scope.all
      else
        scope.where(publish: true).joins(:area).where(areas: {public: true})
      end
    end
  end
end