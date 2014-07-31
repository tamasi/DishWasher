require 'rails_helper'

describe TurnsController do
  describe 'GET#index' do
    before do
      login_admin
      @turns = double(Turn)
      allow(Turn).to receive(:for_organization).and_return(@turns)
    end

    it 'assigns turns' do
      get :index
      expect(assigns(:turns)).to eq(@turns)
    end

    it 'renders index template' do
    end
  end
end