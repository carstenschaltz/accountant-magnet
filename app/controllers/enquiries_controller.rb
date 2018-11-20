class EnquiriesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create, :show]
  before_action :find_enquiry, only: :show

  def show
    authorize @enquiry
  end

  def new
    @enquiry = Enquiry.new
    authorize @enquiry
  end

  def create
    @enquiry = Enquiry.new(enquiry_params)
    authorize @enquiry
    if @enquiry.save
      redirect_to enquiry_path(@enquiry)
    else
      render :new
    end
  end

  private

  def find_enquiry
    @enquiry = Enquiry.find(params[:id])
  end

  def enquiry_params
    params.require(:enquiry).permit(:title, :description, :is_local)
  end
end
