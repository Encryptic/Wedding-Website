class ConfirmationMailer < ActionMailer::Base
  helper :rsvp
  default :from => "Theberge Stone Wedding <wedding@thebergestonewedding.com>"
  layout 'email'

  def confirmation_email(guest)
    @guest = guest
    mail(:to => "#{@guest.first_name} #{@guest.last_name} <#{@guest.email}>", :subject => "Theberge Stone Wedding RSVP Confirmation")
  end

  def admin_email(guest)
    @guest = guest
    mail(:to => "wedding@thebergestonewedding.com", :subject => "#{@guest.first_name} #{@guest.last_name} RSVP Report")
  end
end
