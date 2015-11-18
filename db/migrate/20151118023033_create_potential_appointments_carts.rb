class CreatePotentialAppointmentsCarts < ActiveRecord::Migration
  def change
    create_table :potential_appointments_carts do |t|
       t.references :potential_appointment, index: true, foreign_key: true
      t.references :cart, index: true, foreign_key: true
    end
  end
end
