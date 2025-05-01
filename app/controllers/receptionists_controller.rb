class ReceptionistsController < ApplicationController
  def show
    @name = Current.user.full_name.split(" ").first.capitalize
    @patients = Patient.where(receptionist_id: Current.user.id).order(created_at: :desc)
  end
end
