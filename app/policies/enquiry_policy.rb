class EnquiryPolicy < ApplicationPolicy
  def show?
    record.user == user # unless user.nil?
  end

  def new?
    create?
  end

  def create?
    true
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
