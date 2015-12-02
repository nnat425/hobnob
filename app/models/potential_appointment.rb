class PotentialAppointment < ActiveRecord::Base


  belongs_to :advisor
  has_and_belongs_to_many :carts

def create_appointment

end


end