class Madlib < ActiveRecord::Base
  attr_accessible :field1, :field10, :field11, :field2, :field3, :field4, :field5, :field6, :field7, :field8, :field9

  validates_presence_of :guest

  belongs_to :guest
end
