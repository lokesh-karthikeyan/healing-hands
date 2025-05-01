class PatientsController < ApplicationController
  def create
    @patient = Patient.new(
      name: params[:name],
      age: params[:age],
      appointment_date: params[:appointment_date],
      receptionist_id: Current.user.id
    )

    if @patient.save
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to(receptionist_path(Current.user), notice: "Appointment is booked!") }
      end
    else
      redirect_to(
        receptionist_path(Current.user),
        status: :unprocessable_entity,
        alert: "Unable to process this request"
      )
    end
  end
end
