class QuotesController < ApplicationController

  def new
    @accountant = Accountant.find(params[:accountant][:accountant_id])
    @enquiry = Enquiry.find(params[:accountant][:id])
    @quote = Quote.new(enquiry: @enquiry)
    authorize @quote
  end

  def new_admin
    authorize current_user
    @quote = Quote.new
  end

  def id_check
    authorize current_user
    @accountant = Accountant.where(id: params[:quote][:accountant_id]).first
    @enquiry = Enquiry.where(id: params[:quote][:enquiry_id]).first
    respond_to do |format|
      format.js  # <-- will render `app/views/reviews/create.js.erb`
    end
  end

  def create
    @quote = Quote.new(quote_params)
    if @quote.save
      redirect_to user_path(current_user)
    else
      render :new
    end
      authorize @quote
  end

  def destroy
    @quote = Quote.find(params[:id])
    @quote.destroy
    authorize @quote
  end

  def change_status
    @quote = Quote.find(params[:quote_id])
    @quote.successful = true
    authorize @quote
    if @quote.save
      redirect_to user_path(current_user)
    end
  end

  private

  def quote_params
    params.require(:quote).permit(:message, :accountant_id, :enquiry_id, :invite, :successful)
  end
end
