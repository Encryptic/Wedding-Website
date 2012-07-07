class SessionsController < ApplicationController
  
  before_filter :not_auth_only, :only => [ :new, :create ]
  
  def not_auth_only
    if current_user
      redirect_to users_url
    end
  end
  
  
  def new
  end

  def create
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect_to root_url, :notice => "Logged in!"
    else
      render "new", :notice => "Invalid Username/Password"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end

end
