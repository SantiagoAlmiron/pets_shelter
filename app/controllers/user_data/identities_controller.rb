module UserData
  class IdentitiesController < BaseController
    before_action :load_identity, only: %i(show edit update)

    def show; end

    def new
      @identity = current_user.build_identity
    end

    def create
      @identity = current_user.build_identity(identity_params)

      if @identity.save
        redirect_to user_data_root_path, notice: 'Identidad creada exitosamente.'
      else
        render :new
      end
    end

    def edit; end
    def update; end

    private

    def identity_params
      params.require(:identity).permit(
        :accepted_terms, :apartment, :birth_date, :birth_state, :city,
        :dni, :floor, :gender, :has_children, :has_other_pets, :name,
        :phone, :postal_code, :street_name, :street_number, :surname
      )
    end

    def load_identity
      @identity = current_user.identity
    end
  end
end
