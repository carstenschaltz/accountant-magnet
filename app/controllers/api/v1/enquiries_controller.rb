class Api::V1::EnquiriesController < Api::V1::BaseController
  before_action :find_enquiry, only: [:show_quotes]

  def show_quotes
  end

  private

  def find_enquiry
    @enquiry = Enquiry.find(params[:id])
    authorize @enquiry
  end
end
