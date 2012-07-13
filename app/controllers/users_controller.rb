class UsersController < ApplicationController
  #before_filter :auth_required
  
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @users }
    end
  end
  
  def show
    @user = current_user
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @pages }
    end
  end
  
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
