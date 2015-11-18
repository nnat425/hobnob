class CreatePotentialAppointments < ActiveRecord::Migration
  def change
    create_table :potential_appointments do |t|
      t.string :title, null: false
      t.references :advisor, null: false
      t.datetime :start_time , null: false
      t.datetime :end_time, null: false
      t.boolean :booked_status?, default: false
      t.timestamps null: false
    end
  end
end
