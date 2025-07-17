class PetsController < ApplicationController
  before_action :authorize_resource
  before_action :set_pet, only: %i[ show edit update destroy ]
  skip_before_action :authenticate_user!, only: :show

  def show
  end

  def new
    @pet = Pet.new
  end

  def edit
  end

  def create
    @pet = Pet.new(pet_params)

    if @pet.save
      redirect_to @pet, notice: t('.success')
    else
      render :new, alert: t('.failure')
    end
  end

  def update
    if @pet.update(pet_params)
      redirect_to @pet, notice: t('.success')
    else
      render :edit, alert: t('.failure')
    end
  end

  def destroy
    if @pet.destroy!
      redirect_to root_path, notice: t('.success')
    else
      redirect_to redirect_to @pet, alert: t('.failure')
    end
  end

  private

  def authorize_resource
    authorize(@pet || Pet)
  rescue
    redirect_to root_path, alert: t('pundit.not_authorized')
  end

  def set_pet
    @pet = Pet.includes(:sponsors).find(params[:id])
  end

  def pet_params
    params.require(:pet).permit(
      :name,
      :age,
      :about_pet,
      :physical_characteristics,
      :personality,
      :sociable,
      :weight,
      :status,
      :spot,
      :entry_date,
      :exit_date,
      :photo
    )
  end
end
