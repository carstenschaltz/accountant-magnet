class AccountantsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @accountants = policy_scope(Accountant)
  end

  def show
    @accountant = Accountant.find(params[:id])
    authorize @accountant
  end
end
