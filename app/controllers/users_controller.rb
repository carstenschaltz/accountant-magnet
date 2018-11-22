class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @user_enquiries = Enquiry.where(user_id: current_user.id)
    authorize @user
  end
end

