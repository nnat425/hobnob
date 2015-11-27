class PotentialAppointmentsController < ApplicationController

  def new
    @potential_appointment = PotentialAppointment.new

    @all_appointments =
    PotentialAppointment.all
  end

  def create

    date = params[:appointment_date][:date].split('-')
    if date

    start_time = Time.new(date[0],date[1],date[2],params[:potential_appointment].values[4].to_i,params[:potential_appointment].values[5].to_i).to_s

    end_time = Time.new(date[0],date[1],date[2],params[:potential_appointment].values[9].to_i,params[:potential_appointment].values[10].to_i).to_s

    potential_appointment = current_advisor.potential_appointments.create(title: params[:potential_appointment][:title],start_time: start_time, end_time: end_time)

    redirect_to root_path
  else
    redirect_to new_potential_appointment
    flash[:pick_date] = "Please pick a date/Enter a title"
  end

  def update

  end

  private

  def appointment_params
    params.require(:potential_appointment).permit(:start_time,:end_time,:date)
  end

end