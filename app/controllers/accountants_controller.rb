class AccountantsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :send_email]
  before_action :find_accountant, only: [:send_email, :show]

  def index
    @accountants = policy_scope(Accountant).paginate(page: params[:page], per_page: 10)
    if params[:accountant]
      to_search = params[:accountant][:services].reject(&:blank?).map(&:to_i)
      base_sql = "SELECT id FROM \"accountants\" WHERE EXISTS (SELECT \"accountant_services\".* FROM \"accountant_services\" WHERE (accountants.id = accountant_services.accountant_id AND service_id = #{to_search.first}))"
      to_search[1..-1].each do |id|
        add_serv = " AND EXISTS (SELECT \"accountant_services\".* FROM \"accountant_services\" WHERE (accountants.id = accountant_services.accountant_id AND service_id = #{id}))"
        base_sql += add_serv
      end
      results = Accountant.find_by_sql(base_sql)
      @accountants = Accountant.where(id: results.map(&:id)).paginate(page: params[:page], per_page: 10)
    end

    if params[:search].present?
      @accountants = @accountants.near(params[:search], 50, order: 'distance')
    end

    #New industries filter

    if params[:accountant]
      to_search = params[:accountant][:industries].reject(&:blank?).map(&:to_i)
      base_sql = "SELECT id FROM \"accountants\" WHERE EXISTS (SELECT \"accountant_industries\".* FROM \"accountant_industries\" WHERE (accountants.id = accountant_industries.accountant_id AND industry_id = #{to_search.first}))"
      to_search[1..-1].each do |id|
        add_serv = " AND EXISTS (SELECT \"accountant_industries\".* FROM \"accountant_industries\" WHERE (accountants.id = accountant_industries.accountant_id AND industry_id = #{id}))"
        base_sql += add_serv
      end
      results = Accountant.find_by_sql(base_sql)
      @accountants = Accountant.where(id: results.map(&:id)).paginate(page: params[:page], per_page: 10)
    end


  end

  def show
    @show_button = true
    cnt = 0
    if user_signed_in?
      @open_enquiries = current_user.enquiries.where(closed: false)
      @open_enquiries_no_quote = []
      @open_enquiries.each do |e|
        @open_enquiries_no_quote << e unless e.quotes.any? { |quote| quote.accountant == @accountant }
      end
      current_user.enquiries.each do |enquiry|
        enquiry.quotes.each do |quote|
          if quote.accountant_id == @accountant.id
            cnt += 1
          end
          @show_button = false if cnt == current_user.enquiries.count
        end
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
