require 'rails_helper'

RSpec.describe PetsController, type: :controller do
  let(:valid_attributes) { attributes_for(:pet) }
  let(:invalid_attributes) { attributes_for(:pet, name: nil) }
  let!(:pet) { create(:pet) }
  let(:user) { create(:user) }

  before do
    sign_in user
  end

  describe "GET #show" do
    it "returns a success response" do
      get :show, params: { id: pet.id }
      expect(response).to be_successful
      expect(assigns(:pet)).to eq(pet)
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new
      expect(response).to be_successful
      expect(assigns(:pet)).to be_a_new(Pet)
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      get :edit, params: { id: pet.id }
      expect(response).to be_successful
      expect(assigns(:pet)).to eq(pet)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Pet" do
        expect {
          post :create, params: { pet: valid_attributes }
        }.to change(Pet, :count).by(1)
      end

      it "redirects to the created pet" do
        post :create, params: { pet: valid_attributes }
        expect(response).to redirect_to(Pet.last)
      end
    end

    context "with invalid params" do
      it "does not create a new Pet" do
        expect {
          post :create, params: { pet: invalid_attributes }
        }.not_to change(Pet, :count)
      end

      it "renders the new template" do
        post :create, params: { pet: invalid_attributes }
        expect(response).to render_template(:new)
      end
    end
  end

  describe "PATCH #update" do
    context "with valid params" do
      let(:new_attributes) { { name: Faker::Name.first_name } }

      it "updates the requested pet" do
        patch :update, params: { id: pet.id, pet: new_attributes }
        pet.reload
        expect(pet.name).to eq(new_attributes[:name])
      end

      it "redirects to the pet" do
        patch :update, params: { id: pet.id, pet: new_attributes }
        expect(response).to redirect_to(pet)
      end
    end

    context "with invalid params" do
      it "does not update the pet" do
        patch :update, params: { id: pet.id, pet: invalid_attributes }
        pet.reload
        expect(pet.name).to eq(pet.name)
      end

      it "renders the edit template" do
        patch :update, params: { id: pet.id, pet: invalid_attributes }
        expect(response).to render_template(:edit)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested pet" do
      expect {
        delete :destroy, params: { id: pet.id }
      }.to change(Pet, :count).by(-1)
    end

    it "redirects to the pets list" do
      delete :destroy, params: { id: pet.id }
      expect(response).to redirect_to(pets_path)
    end
  end
end
