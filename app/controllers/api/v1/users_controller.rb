class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: %i[show update destroy]
  def index
  	@users = User.all
  	render json: @users, only: [:name]
  end

  def show
  	render json: @user
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  	  render json: @user
  	else
  	  render json: {error: "Something went wrong"}, status: 400
  	end
  end

  def update
  	if @user
  	  @user.update(user_params)
  	  render json: {message: "User Updated Successfully."}, status: 200
  	else
  	  render json: {error: "Something went wrong"}, status: 400
  	end
  end

  def destroy
  	if @user.destroy
  	  render json: {message: "User Successfully Deleted"}, status: 200
    else
      render json: {error: "Something went wrong"}, status: 400
    end
  end

  private

  def set_user
  	@user = User.find(params[:id])
  end

  def user_params
  	params.require(:user).permit(:name, :password)
  end

end
