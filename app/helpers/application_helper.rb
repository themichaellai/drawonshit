module ApplicationHelper
  def redirect_if_not_admin
    redirect_to players_path unless user_signed_in? and current_user.admin
  end

  def prompt_if_not_signed_in
    unless user_signed_in?
      flash[:alert] = 'You need to sign in to do that!'
      redirect_to :back
    end
  end

  def current_user_is_admin?
    user_signed_in? and current_user.admin
  end
end
