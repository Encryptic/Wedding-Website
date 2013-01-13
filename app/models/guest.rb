class Guest < ActiveRecord::Base

  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :adult_guests, :numericality => { :only_integer => true, :greater_than_or_equal_to => 1, :less_than_or_equal_to  => 5 }, :if => "is_attending?"
  validates :child_guests, :numericality => { :only_integer => true, :greater_than_or_equal_to => 0, :less_than_or_equal_to  => 5 }, :if => "is_attending?"
  validates :toddler_guests, :numericality => { :only_integer => true, :greater_than_or_equal_to => 0, :less_than_or_equal_to  => 5 }, :if => "is_attending?"

  has_many :madlibs

  def is_attending?
    return will_attend
  end
end
