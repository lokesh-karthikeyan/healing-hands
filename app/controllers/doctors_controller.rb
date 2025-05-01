class DoctorsController < ApplicationController
  before_action :authorize_doctor, only: [ :show ]

  def show
    @name = Current.user.full_name.split(" ").first.capitalize
    @patients = Patient.all
    @patient_counts = Patient.group_by_day(:created_at).count
    @appointment_counts = Patient.group_by_day(:appointment_date).count

    if params[:query].present?
      @patients = Patient.where("name LIKE ?", "%#{params[:query]}%")
    else
      @patients = Patient.all
    end
  end

  private

  def authorize_doctor
    redirect_to(root_path, alert: "Unauthorized!") unless Current.user.is_a?(Doctor)
  end
end
