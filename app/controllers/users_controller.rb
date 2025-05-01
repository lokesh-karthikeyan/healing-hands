class UsersController < ApplicationController
  allow_unauthenticated_access only: [ :new ]
  skip_before_action :require_authentication, only: [ :create ]

  def new
  end

  def create
    user_class = constantize_user_role
    @user = user_class.new(
      full_name: params[:full_name],
      email_address: params[:email_address],
      password: params[:password]
    )

    if @user.save
      start_new_session_for(@user)

      if @user.is_a?(Doctor)
        redirect_to(doctor_path(@user), notice: "Signed in successfully!")
      else
        redirect_to(receptionist_path(@user), notice: "Signed in successfully")
      end
    else
      redirect_to(root_path, status: :unprocessable_entity, alert: "Unable to process this request")
    end
  end

  private

  def constantize_user_role
    if params[:role] == "doctor"
      Doctor
    elsif params[:role] == "receptionist"
      Receptionist
    else
      raise "Invalid role"
    end
  end
end
