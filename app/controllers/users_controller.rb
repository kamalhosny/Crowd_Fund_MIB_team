class UsersController < ApplicationController
  skip_before_action: authenticate_member!, only: [:index]
  def show
    user = User.find(params[:id])
    respond_to do |format|
      format.json {render json: user}
    end
  end

  def update
    current_user.update!(user_params)
  end

  private
  def user_params
    params.require(:profile).permit(:email, :username, :age, :gender, :bio, :profile_picture, :facebook, :github, :linked_in, :credit_card)
  end
end
