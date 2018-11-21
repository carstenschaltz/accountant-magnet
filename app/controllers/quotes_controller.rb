class QuotesController < ApplicationController
  def new
    @accountant = Accountant.find(params[:id])
    @enquiry = Enquiry.find(params[:user][:id])
    @quote = Quote.new(enquiry: @enquiry)
    authorize @quote #need to adjust to be for quotes
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
