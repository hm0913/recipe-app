module UsersHelper
  def current_user_has?(user)
    user_signed_in? && current_user == user
  end
end
