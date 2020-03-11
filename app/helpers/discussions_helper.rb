# frozen_string_literal: true

module DiscussionsHelper
  def discussion_author(discussion)
    user_signed_in? && current_user.id == discussion.user_id
  end

  def reply_author(reply)
    user_signed_in? && current_user.id == reply.user_id
  end

  def default_discussion_img(_discussion)
    image_tag('/img/zonankalaloo.png')
 end
end
