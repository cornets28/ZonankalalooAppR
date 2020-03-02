# frozen_string_literal: true

module SerialsHelper
  def serial_author(serial)
    user_signed_in? && current_user.id == serial.user_id
  end
end
