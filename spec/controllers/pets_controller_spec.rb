require 'rails_helper'

RSpec.describe PetsController, type: :controller do
  let(:valid_attributes) { attributes_for(:pet) }
  let(:invalid_attributes) { attributes_for(:pet, name: nil) }
  let!(:pet) { create(:pet) }

  shared_examples "can see pets" do
    it "allows viewing the pet" do
      get :show, params: { id: pet.id }
      expect(response).to be_successful
    end
  end

  shared_examples "cannot manage pets" do
    it "redirects from new" do
      get :new
      expect(response).to redirect_to(root_path)
      expect(flash[:alert]).to eq(I18n.t('pundit.not_authorized'))
    end

    it "redirects from create" do
      post :create, params: { pet: valid_attributes }
      expect(response).to redirect_to(root_path)
      expect(flash[:alert]).to eq(I18n.t('pundit.not_authorized'))
    end

    it "redirects from edit" do
      get :edit, params: { id: pet.id }
      expect(response).to redirect_to(root_path)
      expect(flash[:alert]).to eq(I18n.t('pundit.not_authorized'))
    end

    it "redirects from update" do
      patch :update, params: { id: pet.id, pet: { name: "Updated" } }
      expect(response).to redirect_to(root_path)
      expect(flash[:alert]).to eq(I18n.t('pundit.not_authorized'))
    end

    it "redirects from destroy" do
      delete :destroy, params: { id: pet.id }
      expect(response).to redirect_to(root_path)
      expect(flash[:alert]).to eq(I18n.t('pundit.not_authorized'))
    end
  end

  shared_examples "can manage pets" do
    it "allows new" do
      get :new
      expect(response).to be_successful
    end

    it "creates a pet" do
      expect {
        post :create, params: { pet: valid_attributes }
      }.to change(Pet, :count).by(1)
    end

    it "allows edit" do
      get :edit, params: { id: pet.id }
      expect(response).to be_successful
    end

    it "updates the pet" do
      patch :update, params: { id: pet.id, pet: { name: "Updated" } }
      expect(response).to redirect_to(pet)
      pet.reload
      expect(pet.name).to eq("Updated")
    end

    it "destroys the pet" do
      expect {
        delete :destroy, params: { id: pet.id }
      }.to change(Pet, :count).by(-1)
    end
  end

  context "as regular user" do
    let(:user) { create(:user, role: "user") }

    before { sign_in user }

    include_examples "can see pets"
    include_examples "cannot manage pets"
  end

  context "as admin user" do
    let(:user) { create(:user, role: "admin") }

    before { sign_in user }

    include_examples "can see pets"
    include_examples "can manage pets"
  end

  context "as superadmin user" do
    let(:user) { create(:user, role: "superadmin") }

    before { sign_in user }

    include_examples "can see pets"
    include_examples "can manage pets"
  end
end
