class UserController < ApplicationController

  def login
  end

  def show
    if params[:user].nil? || params[:user][:password] != "sweetyapp"
      flash[:error] = "Login failed. Please try again .."
      redirect_to user_login_path
    else
      session[:username] = params[:user][:username]
      redirect_to statistics_index_path    
    end    
  end

  def logout
    session = nil
    flash[:notice] = "Logged out successfully .."  
    redirect_to root_path
  end
end
