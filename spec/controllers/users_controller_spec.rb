require 'rails_helper'

describe UsersController do
  let(:current_user) { create(:user) }
  let(:other_user) { create(:user) }
  before do
    sign_in current_user
  end

  describe '#show' do
    context 'when params are not sent' do
      it 'shows current user' do
        get :show
        expect(@controller.view_assigns['user']).to eq(controller.current_user)
      end

      it 'loads the locations created by current user' do
        current_user.locations = [create(:location, creator: current_user)]
        get :show
        expect(@controller.view_assigns['locations_shared']).to eq(controller.current_user.locations)
      end
    end

    context 'when params are sent' do
      it 'loads the user from params' do
        get :show, params: {id: other_user.id}
        expect(@controller.view_assigns['user']).to eq(other_user)
      end

      it 'loads location of the selected user if public' do
        location = create(:location, creator: other_user, public: true)
        other_user.locations = [location]
        get :show, params: {id: other_user.id}
        expect(@controller.view_assigns['locations_shared']).to eq([location])
      end

      it 'does not load locations that are not public' do
        location = create(:location, creator: other_user, public: false)
        other_user.locations = [location]
        get :show, params: {id: other_user.id}
        expect(@controller.view_assigns['locations_shared']).to eq([])
      end
    end
  end
end
