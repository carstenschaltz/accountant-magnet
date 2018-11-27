class AccountantsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :send_email]
  before_action :find_accountant, only: [:send_email, :show]

  def index
    @accountants = policy_scope(Accountant).paginate(page: params[:page], per_page: 10)
    if params[:accountant]
      service = Service.find(params[:accountant][:services]).name
      @accountants = @accountants.service(service) if service.present?
    end
  end

  def show
    if user_signed_in?
      @open_enquiries = current_user.enquiries.where(closed: false)
      @open_enquiries_no_quote = []
      @open_enquiries.each do |e|
        @open_enquiries_no_quote << e unless e.quotes.any? { |quote| quote.accountant == @accountant }
      end
    else
      @open_enquiries = []
      @open_enquiries_no_quote = []
    end
  end

  def send_email
    @body = params[:body]
    @email_from = current_user.email
    @subject = params[:subject]
    AccountantMailer.contact(@body, @email_from, @subject, @accountant.email).deliver_now
    redirect_to root_path
  end

  private

  def find_accountant
    @accountant = Accountant.find(params[:id] || params[:accountant_id])
    authorize @accountant
  end
end
