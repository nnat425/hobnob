class PotentialAppointmentsController < ApplicationController

  def new
    @potential_appointment = PotentialAppointment.new

    @all_appointments =
    PotentialAppointment.all
  end

  def create

    date = Date.new(params[:potential_appointment].values[0].to_i, params[:potential_appointment].values[1].to_i,params[:potential_appointment].values[2].to_i)

    start_time = Time.new(params[:potential_appointment].values[3].to_i, params[:potential_appointment].values[4].to_i,params[:potential_appointment].values[5].to_i,params[:potential_appointment].values[6].to_i,params[:potential_appointment].values[7].to_i).to_s

    end_time = Time.new(params[:potential_appointment].values[8].to_i, params[:potential_appointment].values[9].to_i,params[:potential_appointment].values[10].to_i,params[:potential_appointment].values[11].to_i,params[:potential_appointment].values[12].to_i).to_s

    potential_appointment = current_advisor.potential_appointments.create(start_time: start_time, end_time: end_time, date: date)

    # if potential_appointment.start_time != nil
      redirect_to root_path
    # else
    #   redirect_to new_potential_appointment_path
    # end
  end

  private

  def appointment_params
    params.require(:potential_appointment).permit(:start_time,:end_time,:date)
  end

end