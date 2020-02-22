# frozen_string_literal: true

class RegistrationsController < Devise::RegistrationsController
  # before_action :set_partners

  private

  def sign_up_params
    params.require(:user).permit(:username, :userlastname, :email, :password, :password_confirmation, :avatar)
    # @channels = Channel.all
  end

  def account_update_params
    params.require(:user).permit(:username, :userlastname, :email, :password, :password_confirmation, :current_password, :avatar)
  end
end
