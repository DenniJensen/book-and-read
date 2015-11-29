require 'rails_helper'

describe UsersController do
  let(:user) { create :user, :with_books  }

  before do
    allow(controller).to receive(:authenticate_user!).and_return(true)
    allow(controller).to receive(:current_user).and_return(user)
  end

  describe 'GET show' do
    it 'shows the user by id' do
      get :show, id: user.id
      expect(assigns(:user)).to eq user
    end
  end
end
