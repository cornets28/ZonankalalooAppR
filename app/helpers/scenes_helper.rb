# frozen_string_literal: true

module ScenesHelper
  def scene_author(scene)
    user_signed_in? && current_user.id == scene.user.id
  end
  
end


