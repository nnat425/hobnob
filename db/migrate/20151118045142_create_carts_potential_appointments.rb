class CreateCartsPotentialAppointments < ActiveRecord::Migration
  def change
    create_table :carts_potential_appointments do |t|
       t.references :potential_appointment, index: true, foreign_key: true
      t.references :cart, index: true, foreign_key: true

    end
  end
end

