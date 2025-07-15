class PetPolicy < ApplicationPolicy
  def show?
    true
  end

  def create?
    allow_if_superadmin { user.present? && user.admin? }
  end

  def new?
    create?
  end

  def update?
    allow_if_superadmin { user.present? && user.admin? }
  end

  def edit?
    update?
  end

  def destroy?
    allow_if_superadmin { user.present? && user.admin? }
  end
end
