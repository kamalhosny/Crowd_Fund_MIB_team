# frozen_string_literal: true

class UsersController < ApplicationController
  skip_before_action :authenticate_member!, only: [:show]

  def show
    user = User.find(params[:id])
    respond_to do |format|
      format.json { render json: user }
    end
  end

  def update
    user = User.find(params[:id])
    respond_to do |format|
      if user.update! user_params
        format.json { render json: user }
      else
        format.json { render user.errors.full_messages.to_json, status: 400 }
      end
    end
  end

  def destroy
    user = User.find params[:id]
    respond_to do |format|
      if user.delete
        format.json { render json: { message: "user: '#{params[:id]}' deleted" }, status: 200 }
      else
        format.json { render user.errors.full_messages.to_json, status: 400 }
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :username, :age, :gender, :bio, :profile_picture, :facebook, :github, :linked_in, :credit_card)
  end
end
