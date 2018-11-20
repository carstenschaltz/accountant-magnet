class UsersController < ApplicationController
  # authorize @

  def show
    @user = User.find(params[:id])
    @all_enquiries = Enquiry.where(user_id: current_user.id)
    authorize @user
  end
end


