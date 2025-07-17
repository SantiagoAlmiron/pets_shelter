class ApplicationController < ActionController::Base
  include Pundit::Authorization

  before_action :authenticate_user!, :check_for_blocked_user

  private

  def check_for_blocked_user
    if current_user&.blocked?
      sign_out current_user
      redirect_to root_path, alert: t('devise.failure.blocked')
    end
  end
end
