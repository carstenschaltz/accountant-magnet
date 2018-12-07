class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: :network

  def show
    @user = User.find(params[:id])
    @user_enquiries = Enquiry.where(user_id: @user.id)
    authorize @user
  end

  def network
    @user = current_user
    if @user
      authorize @user
    else
      authorize User.first
    end
  end
end
