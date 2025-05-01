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

  def edit
    @patient = Patient.find(params[:id])
  end

  def update
    @patient = Patient.find(params[:id])

    if @patient.update(patient_params)
      respond_to do |format|
        format.turbo_stream
        format.html {
          redirect_to(receptionist_path(Current.user), notice: "Patient was updated successfully.")
        }
      end
    else
      render(:edit, alert: "Unable to process this request")
    end
  end

  def destroy
    @patient = Patient.find(params[:id])
    @patient.destroy

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to(receptionist_path(Current.user), notice: "Patient deleted successfully!") }
    end
  end

  private

  def patient_params = (params.expect(patient: [ :name, :age, :appointment_date ]))
end
