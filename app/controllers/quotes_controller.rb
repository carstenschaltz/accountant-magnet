class QuotesController < ApplicationController

  def new
    @accountant = Accountant.find(params[:accountant][:accountant_id])
    @enquiry = Enquiry.find(params[:accountant][:id])
    @quote = Quote.new(enquiry: @enquiry)
    authorize @quote
  end

  def create
    @quote = Quote.new(quote_params)
    @quote.invite = true
    @quote.successful = true
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
      redirect_to user_path(current_user)
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
    params.require(:quote).permit(:message, :accountant_id, :enquiry_id)
  end
end
