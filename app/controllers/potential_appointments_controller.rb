class PotentialAppointmentsController < ApplicationController

  def new
    @potential_appointment = PotentialAppointment.new

    current_advisor = Advisor.find_by(id: session[:user_or_advisor_id])
    @advisor_appointments = current_advisor.potential_appointments
  end

  def create

    date = params[:appointment_date][:date].split('-')
    if date[0] != nil && params[:potential_appointment][:title] != ""

      start_time = Time.new(date[0],date[1],date[2],params[:potential_appointment].values[4].to_i,params[:potential_appointment].values[5].to_i).to_s

      end_time = Time.new(date[0],date[1],date[2],params[:potential_appointment].values[9].to_i,params[:potential_appointment].values[10].to_i).to_s

      potential_appointment = current_advisor.potential_appointments.create(title: params[:potential_appointment][:title],start_time: start_time, end_time: end_time)

      redirect_to new_potential_appointment_path
    else
       flash[:pick_date_or_enter_title] = "Please pick a date/Enter a title"

      redirect_to new_potential_appointment_path

    end
  end

  def update
  end

  def edit
  @potential_appointment = PotentialAppointment.find_by(id: params[:id])
  @advisor_appointments = current_advisor.potential_appointments
  end

  private

  def appointment_params
    params.require(:potential_appointment).permit(:start_time,:end_time,:date)
  end

end