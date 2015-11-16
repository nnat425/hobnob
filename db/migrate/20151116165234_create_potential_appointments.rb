class CreatePotentialAppointments < ActiveRecord::Migration
  def change
    create_table :potential_appointments do |t|
      t.references :advisor, null: false
      t.references :cart
      t.time :start_time , null: false
      t.time :end_time, null: false
      t.date :date, null: false
      t.boolean :booked_status?, default: false
      t.timestamps null: false
    end
  end
end
