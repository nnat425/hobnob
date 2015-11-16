class PotentialAppointmentsController < ApplicationController

  def new
    @potential_appointment = PotentialAppointment.new
  end

  def create
    # binding.pry
  # potential_appointment = PotentialAppointment.create(:start_time, end_time:, date:)
  end


 end