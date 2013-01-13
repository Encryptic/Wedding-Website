class RsvpController < ApplicationController
  def index
  end

  def show
    @guest = Guest.find_by_code(params[:id].upcase)
    @last_madlib = @guest.madlibs.last

    if @last_madlib == nil
      @last_madlib = Madlib.new
    end

    if @guest == nil
      redirect_to "/rsvp"
      return
    end

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  def confirm
    @guest = Guest.find_by_code(params[:guest_code])
    @madlib = @guest.madlibs.new

    @madlib.field1 = params[:field1]
    @madlib.field2 = params[:field2]
    @madlib.field3 = params[:field3]
    @madlib.field4 = params[:field4]
    @madlib.field5 = params[:field5]
    @madlib.field6 = params[:field6]
    @madlib.field7 = params[:field7]
    @madlib.field8 = params[:field8]
    @madlib.field9 = params[:field9]
    @madlib.field10 = params[:field10]
    @madlib.field11 = params[:field11]

    @guest.will_attend = params[:attending] == "yes"
    @guest.rsvp_date = Time.now

    if @guest.will_attend
      @guest.adult_guests = params[:adult_guests]
      @guest.child_guests = params[:child_guests]
      @guest.toddler_guests = params[:toddler_guests]
    else
      @guest.adult_guests = 0
      @guest.child_guests = 0
      @guest.toddler_guests = 0
    end

    if params[:send_email] == "yes"
      @guest.email = params[:email]
      ConfirmationMailer.confirmation_email(@guest).deliver
    else
      @guest.email = ''
    end

    respond_to do |format|
      if @guest.save() && @madlib.save()
        format.html
      else
        format.html { render :action => "show" }
      end
    end
  end
end
