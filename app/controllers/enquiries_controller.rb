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
        flash[:notice] = 'Your enquiry has been created! Sign in to see it & invite accountants to quote'
        redirect_to new_user_session_path(email: enquiry_params[:email])
      else
        flash[:notice] = 'Your enquiry has been created! Sign up to see it on your dashboard & invite accountants to quote'
        redirect_to new_user_registration_path(email: enquiry_params[:email])
      end
    else
      render :new
    end
    assign_user(@enquiry)
  end

  def edit
    @enquiry = Enquiry.find(params[:id])
    authorize @enquiry
  end

  def update
    @enquiry.update(enquiry_params)
    if @enquiry.save
      update_services(@enquiry)
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  def destroy
    @enquiry = Enquiry.find(params[:id])
    @enquiry.destroy
    authorize @enquiry
    redirect_to user_path(current_user)
  end

  private

  def find_enquiry
    @enquiry = Enquiry.find(params[:id])
    authorize @enquiry
  end

  def enquiry_params
    params.require(:enquiry).permit(:title, :email, :description, :is_local, :industry_string, :size, :location, :closed)
  end

  def update_services(enquiry)
    enquiry.enquiry_services.destroy_all
    services = params[:enquiry][:services]
    services.each do |service_name|
      service = Service.find_by_name(service_name)
      EnquiryService.create(enquiry: @enquiry, service: service) if SERVICES.include?(service_name)
    end
    enquiry.save
  end

  def update_comp_info(enquiry)
    enquiry.industry_string = nil if params[:enquiry][:industry_string].empty?
    enquiry.size = nil if params[:enquiry][:size].empty?
    enquiry.location = nil if params[:enquiry][:location].empty?
    enquiry.save
  end

  def assign_user(enquiry)
    user = User.find_by(email: enquiry.email)
    enquiry.update(user: user) if user
  end
end
