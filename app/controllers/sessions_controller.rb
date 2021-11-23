class SessionsController < ApplicationController
  skip_before_action :authorized, only: [:new, :create, :welcome]
  
  def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to '/entries'
    else
      flash[:incorrect_login] = 'Invalid Credentials'
      redirect_to '/login'
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to '/welcome'
  end
end
