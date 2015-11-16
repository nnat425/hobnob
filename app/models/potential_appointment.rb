class PotentialAppointment < ActiveRecord::Base
  belongs_to :advisor
  belongs_to :cart


end