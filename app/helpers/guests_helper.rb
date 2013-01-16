module GuestsHelper

  def to_csv(guests)
    first_rsvp_day = Date.parse("2013-01-14")

    CSV.generate do |csv|
      csv << [ "first_name", "last_name", "email", "rsvp date", "responded", "updated at", "will attend", "adult guests", "child guests", "toddler guests"]
      guests.each do |guest|
        csv << [ guest.first_name, guest.last_name, guest.email.to_s, guest.rsvp_date.to_s(:short), (guest.rsvp_date >= first_rsvp_day).to_s , guest.updated_at.to_s(:short), guest.will_attend.to_s, guest.adult_guests.to_s, guest.child_guests.to_s, guest.toddler_guests.to_s]
      end
    end
  end
end
