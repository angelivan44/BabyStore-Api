class ClothePolicy < ApplicationPolicy
  def create?
    user.role == "admin"
  end
  
  def update?
    create?
  end

  def destroy?
    create?
  end
end