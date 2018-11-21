class AccountantsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @accountants = policy_scope(Accountant)
  end

  def show
    @accountant = Accountant.find(params[:id])
    @open_enquiries = current_user.enquiries.where(closed: false)
    @open_enquiries_no_quote = []
    @open_enquiries.each do |e|
      @open_enquiries_no_quote << e unless e.quotes.any? { |quote| quote.accountant == @accountant }
    end
    authorize @accountant
  end
end
