class UsersController < ApplicationController
  def new
    if not current_user and User.all().count() > 0
      redirect_to root_url
    end
    
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to root_url, :notice => "Signed up!"
    else
      render "new"
    end
  end

end
