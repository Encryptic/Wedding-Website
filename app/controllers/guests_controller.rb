class GuestsController < ApplicationController
  before_filter :auth_required  , :only => [:index, :show, :new, :edit, :create, :update, :destroy]

  # GET /guests
  # GET /guests.json
  def index
    @guests = Guest.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @guests }
    end
  end

  # GET /guests/1
  # GET /guests/1.json
  def show
    @guest = Guest.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      #format.json { render :json => @guest }
    end
  end

  def validate
    @guest = Guest.find_by_code(params[:id].upcase)

    respond_to do |format|
      format.json { render :json => @guest != nil }
    end
  end

  # GET /guests/new
  # GET /guests/new.json
  def new
    @guest = Guest.new

    respond_to do |format|
      format.html # new.html.erb
      #format.json { render :json => @guest }
    end
  end

  # GET /guests/1/edit
  def edit
    @guest = Guest.find(params[:id])
  end

  # POST /guests
  # POST /guests.json
  def create
    @guest = Guest.new(params[:guest])
    @guest.code = @guest.code.upcase

    respond_to do |format|
      if @guest.save
        format.html { redirect_to @guest, :notice => 'Guest was successfully created.' }
        format.json { render :json => @guest, :status => :created, :location => @guest }
      else
        format.html { render :action => "new" }
        format.json { render :json => @guest.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /guests/1
  # PUT /guests/1.json
  def update
    @guest = Guest.find(params[:id])

    respond_to do |format|
      if @guest.update_attributes(params[:guest])
        format.html { redirect_to @guest, :notice => 'Guest was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @guest.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /guests/1
  # DELETE /guests/1.json
  def destroy
    @guest = Guest.find(params[:id])
    @guest.destroy

    respond_to do |format|
      format.html { redirect_to guests_url }
      format.json { head :ok }
    end
  end
end
