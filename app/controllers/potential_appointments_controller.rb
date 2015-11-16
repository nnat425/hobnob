class PotentialAppointmentsController < ApplicationController

  def new
    @potential_appointment = PotentialAppointment.new
  end

  def create
    potential_appointment = current_advisor.potential_appointments.create(:start_time, end_time:, date:)
  end


 end