module Admin
  class UsersController < BaseController
    before_action :load_user, except: :index
    before_action :check_super_admin, only: [:block, :unblock]

    def index
      @users = User.all.order(:id)
    end

    def show; end

    def block
      @user.update(blocked_at: Time.current)
      redirect_to admin_users_path, notice: t('.blocked')
    end

    def unblock
      @user.update(blocked_at: nil)
      redirect_to admin_users_path, notice: t('.unblocked')
    end

    def update_role
      @user = User.find(params[:id])
      if @user.update(role: params[:role])
        flash[:notice] = t('.rol_updated')
        render json: { message: "ok" }, status: :ok
      else
        flash[:alert] = t('.rol_update_error')
        render json: { error: "No se pudo actualizar" }, status: :unprocessable_entity
      end
    end

    private

    def check_super_admin
      if @user.superadmin?
        redirect_to admin_users_path, alert: t('.block_error')
      end
    end

    def load_user
      @user = User.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to admin_users_path, alert: t('.not_found')
    end
  end
end
