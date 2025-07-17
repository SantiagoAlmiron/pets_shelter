module Admin
  class BaseController < ApplicationController
    before_action :authorize_admin!

    private

    def authorize_admin!
      redirect_to root_path, alert: t('.unauthorized') unless current_user.can_access_admin_area?
    end
  end
end
