class PotentialAppointment < ActiveRecord::Base


  belongs_to :advisor
  has_many :purchases
  has_many :carts, through: :purchases



end