require 'rails_helper'

describe UsersController do
  let(:user) { create :user, :with_books  }
  describe 'GET show' do
    it 'shows the user by id' do
      get :show, id: user.id
      expect(assigns(:user)).to eq user
    end
  end
end
