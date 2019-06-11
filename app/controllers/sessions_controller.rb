class SessionsController < ApplicationController

  def new
    @user = User.new
    render :login
  end

  def create
    # find the user that want to log in 56:33
    @user = User.find_by(username: params[:user][:username])
    # if we find the user and authenticate it's password then
    if @user && @user.authenticate(params[:user][:password])
      # sign them in
      session[:user_id] = @user.id
      redirect_to pets_path
    else
      flash[:error] = "Sorry, your username or password was incorrect"
      redirect_to '/login'
    end
  end

  def home
  end

  #logout
  def destroy
    session.clear
    redirect_to '/'
  end

end
