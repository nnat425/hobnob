class PotentialAppointmentsController < ApplicationController

  def new
    @appointment = PotentialAppointment.new
  end

  def create
  end

end