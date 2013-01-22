class Guest < ActiveRecord::Base

  attr_accessible :first_name, :last_name, :email,  :rsvp_date, :updated_at, :will_attend, :adult_guests, :child_guests, :toddler_guests, :code, :private_notes, :notes

  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :adult_guests, :numericality => { :only_integer => true, :greater_than_or_equal_to => 1, :less_than_or_equal_to  => 5 }, :if => "is_attending?"
  validates :child_guests, :numericality => { :only_integer => true, :greater_than_or_equal_to => 0, :less_than_or_equal_to  => 5 }, :if => "is_attending?"
  validates :toddler_guests, :numericality => { :only_integer => true, :greater_than_or_equal_to => 0, :less_than_or_equal_to  => 5 }, :if => "is_attending?"

  has_many :madlibs, :dependent => :destroy

  def is_attending?
    return will_attend
  end
end
