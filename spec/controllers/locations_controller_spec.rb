require 'rails_helper'

describe LocationsController do
  let(:current_user) { create(:user) }
  before do
    sign_in current_user
  end

  describe '#create' do
    it 'adds current_user as creator of location' do
      post :create, params: { location: { name: 'loc', latitude: 1.2345, longitude: 4.5678 }}
      location = Location.last
      expect(location.creator).to eq(current_user)
    end
  end
end
