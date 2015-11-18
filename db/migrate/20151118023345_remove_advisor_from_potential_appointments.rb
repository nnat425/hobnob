class RemoveAdvisorFromPotentialAppointments < ActiveRecord::Migration
  def change
  remove_reference :potential_appointments, :advisor

  end
end
