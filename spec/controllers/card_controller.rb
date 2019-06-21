require 'rails_helper'

describe CardController do
  describe 'POST #update' do
    it 'redirect_to board_path' do
      post :create, params: { id: 1 }
      expect(response).to redirect_to board_path(id: 1)
    end
  end
end
