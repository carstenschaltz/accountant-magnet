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
    if @quote.save
      redirect_to accountant_path(quote_params[:accountant_id])
    else
      render :new
    end
    authorize @quote
  end

  private

  def quote_params
    params.require(:quote).permit(:message, :accountant_id, :enquiry_id)
  end
end
