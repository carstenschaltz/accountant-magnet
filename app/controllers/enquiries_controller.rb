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
    update_comp_info(@enquiry)
    if @enquiry.save
      update_services(@enquiry)
      if user_signed_in?
        @enquiry.update(user: current_user)
        redirect_to user_path(current_user)
      elsif User.where(email: enquiry_params[:email]).any?
        redirect_to new_user_session_path(email: enquiry_params[:email])
      else
        redirect_to new_user_registration_path(email: enquiry_params[:email])
      end
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
    params.require(:enquiry).permit(:title, :email, :description, :is_local, :industry, :size, :location)
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
    enquiry.save
  end

  def update_comp_info(enquiry)
    enquiry.industry = nil if params[:enquiry][:industry].empty?
    enquiry.size = nil if params[:enquiry][:size].empty?
    enquiry.location = nil if params[:enquiry][:location].empty?
    enquiry.save
  end
end
