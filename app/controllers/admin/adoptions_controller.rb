module Admin
  class AdoptionsController < BaseController
    before_action :set_pet, except: :index

    def index
      @pets = Pet.all
    end

    def edit; end

    # No me gusta mucho como quedo esta lógica, pero no se me ocurre otra forma de hacerlo
    def update
      ActiveRecord::Base.transaction do
        @pet.adopter = User.find_by(id: params[:adopter_id].presence)

        @pet.sponsorships.destroy_all

        Array(params[:sponsor_ids]).each do |sponsor_id|
          Sponsorship.create!(
            pet_id: @pet.id,
            user_id: sponsor_id,
          )
        end

        @pet.save!
      end

      redirect_to admin_adoption_path(@pet), notice: "Mascota actualizada"
    rescue ActiveRecord::RecordInvalid => e
      flash.now[:alert] = "Hubo un error: #{e.message}"
      render :edit
    end

    private

    def pet_params
      params.require(:pet).permit(
        :name, :age, :about_pet, :physical_characteristics,
        :personality, :sociable, :weight, :status, :spot,
        :entry_date, :exit_date
      )
    end

    def set_pet
      @pet = Pet.find(params[:id])
    end
  end
end
