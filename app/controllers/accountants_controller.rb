class AccountantsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @accountants = policy_scope(Accountant)
  end
end
