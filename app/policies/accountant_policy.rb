class AccountantPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

  def send_email?
    true
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
