class ReceptionistsController < ApplicationController
  before_action :authorize_receptionist, only: [ :show ]

  def show
    @name = Current.user.full_name.split(" ").first.capitalize
    @patients = Patient.where(receptionist_id: Current.user.id).order(created_at: :desc)
  end

  private

  def authorize_receptionist
    redirect_to(root_path, alert: "Unauthorized!") unless Current.user.is_a?(Receptionist)
  end
end
