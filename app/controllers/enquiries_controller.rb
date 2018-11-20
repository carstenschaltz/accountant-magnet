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
      services = params[:enquiry][:services]
      services.each do |service_name|
        if SERVICES.include?(service_name)
          EnquiryService.create(enquiry: @enquiry, service: Service.find_by_name(service_name))
        end
      end
      @enquiry.save
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
    params.require(:enquiry).permit(:title, :email, :description, :is_local)
  end
end
