class EnquiriesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create, :show, :update, :destroy]
  before_action :find_enquiry, only: [:show, :update, :destroy]

  def show
  end

  def new
    @enquiry = Enquiry.new
    authorize @enquiry
  end

  def create
    @enquiry = Enquiry.new(enquiry_params)
    authorize @enquiry
    if @enquiry.save
      update_services(@enquiry)
      redirect_to enquiry_path(@enquiry)
    else
      render :new
    end
  end

  def update
    @enquiry.update(enquiry_params)
    if @enquiry.save
      update_services(@enquiry)
      redirect_to enquiry_path(@enquiry)
    else
      render :new
    end
  end

  def destroy
    @enquiry.destroy
    redirect_to root_path
  end

  private

  def find_enquiry
    @enquiry = Enquiry.find(params[:id])
    authorize @enquiry
  end

  def enquiry_params
    params.require(:enquiry).permit(:title, :email, :description, :is_local)
  end

  def update_services(enquiry)
    enquiry.enquiry_services.destroy_all
    services = params[:enquiry][:services]
    services.each do |service_name|
      service = Service.find_by_name(service_name)
      if SERVICES.include?(service_name)
        EnquiryService.create(enquiry: @enquiry, service: service)
      end
    end
    @enquiry.save
  end
end
