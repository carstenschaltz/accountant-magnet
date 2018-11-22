class QuotePolicy < ApplicationPolicy
  def new?
    # record.all? { |enquiry| enquiry.user == user }
    create?
  end

  def create?
    record.enquiry.user == user
  end

  def destroy?
    record.enquiry.user == user
  end

  def change_status?
    record.enquiry.user == user
  end


  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
