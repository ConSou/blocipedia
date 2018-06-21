class WikiPolicy < ApplicationPolicy

  def index?
    true
  end

  def show?
    index?
  end

  def create?
    user.present?
  end

  def edit?
    user.present?
  end

  def update?
    edit?
  end

  def destroy?
    user.present? && user == record.user
  end

end
