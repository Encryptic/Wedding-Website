class RsvpController < ApplicationController
  def index
  end

  def show
    response.headers["Cache-Control"] = "no-cache, no-store, max-age=0, must-revalidate"
    response.headers["Pragma"] = "no-cache"
    response.headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"

    @guest = Guest.find_by_code(params[:id].upcase)

    if @guest == nil
      redirect_to "/rsvp"
    end

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  def confirm
    @guest = Guest.find_by_code(params[:guest_code])
    @guest.will_attend = params[:attending] == "yes"

    if @guest.will_attend
      @guest.adult_guests = params[:adult_guests]
      @guest.child_guests = params[:child_guests]
    else
      @guest.adult_guests = 0
      @guest.child_guests = 0
    end

    if params[:send_email] == "yes"
      @guest.email = params[:email]
      ConfirmationMailer.confirmation_email(@guest).deliver
    else
      @guest.email = ''
    end
    @guest.save()

    respond_to do |format|
      format.html # confirm.html.erb
    end
  end
end
