class UserPolicy < ApplicationPolicy

  def show?
    record == user || user.admin
  end

  def new_admin?
    record.admin == true
  end

  def id_check?
    record.admin == true
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end



