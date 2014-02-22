module ApplicationHelper
  def redirect_if_not_admin
    redirect_to players_path unless user_signed_in? and current_user.admin
  end

  def current_user_is_admin?
    user_signed_in? and current_user.admin
  end
end
