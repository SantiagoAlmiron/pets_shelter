require 'rails_helper'

RSpec.describe Admin::UsersController, type: :controller do
  include Devise::Test::ControllerHelpers
  render_views

  let(:admin) { create(:user, role: 'admin') }
  let(:superadmin) { create(:user, role: 'superadmin') }
  let(:user) { create(:user) }

  before do
    sign_in admin
  end

  describe 'GET #index' do
    it 'assigns all users and renders index' do
      users = create_list(:user, 3)
      get :index
      expect(assigns(:users)).to match_array(User.all)
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #show' do
    it 'assigns the requested user' do
      get :show, params: { id: user.id }
      expect(assigns(:user)).to eq(user)
      expect(response).to render_template(:show)
    end

    it 'redirects if user not found' do
      get :show, params: { id: 'invalid' }
      expect(response).to redirect_to(admin_users_path)
      expect(flash[:alert]).to eq(I18n.t('admin.users.not_found'))
    end
  end

  describe 'POST #block' do
    it 'blocks the user and redirects' do
      post :block, params: { id: user.id }
      user.reload
      expect(user.blocked_at).not_to be_nil
      expect(response).to redirect_to(admin_users_path)
      expect(flash[:notice]).to eq(I18n.t('admin.users.blocked'))
    end

    it 'does not block superadmin and redirects with alert' do
      post :block, params: { id: superadmin.id }
      expect(response).to redirect_to(admin_users_path)
      expect(flash[:alert]).to eq(I18n.t('admin.users.block_error'))
    end
  end

  describe 'POST #unblock' do
    before { user.update!(blocked_at: Time.current) }

    it 'unblocks the user and redirects' do
      post :unblock, params: { id: user.id }
      user.reload
      expect(user.blocked_at).to be_nil
      expect(response).to redirect_to(admin_users_path)
      expect(flash[:notice]).to eq(I18n.t('admin.users.unblocked'))
    end

    it 'does not unblock superadmin and redirects with alert' do
      superadmin.update!(blocked_at: Time.current)
      post :unblock, params: { id: superadmin.id }
      expect(response).to redirect_to(admin_users_path)
      expect(flash[:alert]).to eq(I18n.t('admin.users.block_error'))
    end
  end

  describe 'PATCH #update_role' do
    it 'updates the user role and returns ok' do
      patch :update_role, params: { id: user.id, role: 'admin' }, format: :json
      user.reload
      expect(user.role).to eq('admin')
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)['message']).to eq('ok')
      expect(flash[:notice]).to eq(I18n.t('admin.users.rol_updated'))
    end

    it 'fails to update role and returns error' do
      allow_any_instance_of(User).to receive(:update).and_return(false)
      patch :update_role, params: { id: user.id, role: 'invalid' }, format: :json
      expect(response).to have_http_status(:unprocessable_entity)
      expect(JSON.parse(response.body)['error']).to eq('No se pudo actualizar')
      expect(flash[:alert]).to eq(I18n.t('admin.users.rol_update_error'))
    end
  end
end
