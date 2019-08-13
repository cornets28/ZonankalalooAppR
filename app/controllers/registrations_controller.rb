class RegistrationsController < Devise::RegistrationsController
  # before_action :set_channels
  private
  # def set_channels
  #   if !Channel.nil?
  #     @channels = Channel.all
  #   end
  # end
  def sign_up_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
    # @channels = Channel.all
  end

  def account_update_params
    params.require(:user).permit(:username, :userlastname, :email, :password, :password_confirmation, :current_password)
  end

end