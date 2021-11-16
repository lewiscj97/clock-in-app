class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(params.require(:user).permit(:email, :first_name, :last_name, :password))
    session[:user_id] = @user.id
    redirect_to '/welcome'
  end
end