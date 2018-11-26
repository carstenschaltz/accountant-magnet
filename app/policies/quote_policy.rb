class QuotePolicy < ApplicationPolicy
  def show?
    record.enquiry.user == user || user.admin
  end

  def new?
    # record.all? { |enquiry| enquiry.user == user }
    create?
  end

  def create?
    record.enquiry.user == user || user.admin
  end

  def destroy?
    record.enquiry.user == user || user.admin
  end

  def change_status?
    true
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
