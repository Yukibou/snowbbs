class AvalancheAreaPolicy < ApplicationPolicy
  def index?
    @user.admin?
  end

  def show?
    @user.admin? or @user == @record
  end

  def create?
    @user.admin?
  end

  def new?
    create?
  end

  def update?
    @user.admin?
  end

  def edit?
    update?
  end

  def destroy?
    return false if @user == @record
    @user.admin?
  end
end
