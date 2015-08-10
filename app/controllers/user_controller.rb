class UserController < ApplicationController

  def login
  end

  def show
    user_data = params[:user]
    if user_data.nil? || user_data[:password] != user_data[:username]
      flash[:error] = "Login failed. Please try again .."
      redirect_to user_login_path
    else
      session[:username] = user_data[:username]
      redirect_to statistics_index_path    
    end    
  end

  def logout
    session = nil
    flash[:notice] = "Logged out successfully .."  
    redirect_to root_path
  end
end
