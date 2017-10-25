class ObservationPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

  def create?
    # true
    user.present?
  end

  def new?
    create?
  end

  def update?
    # true
    if user.present?
      user.admin? || record.user_id == user.id
    end
  end

  def edit?
    update?
  end

  def destroy?
    # true
    if user.present?
      user.admin? || record.user_id == user.id
    end
  end
end