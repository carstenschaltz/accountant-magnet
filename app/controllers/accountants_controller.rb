class AccountantsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

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
  end

  def show
    @accountant = Accountant.find(params[:id])

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

    authorize @accountant
  end
end
