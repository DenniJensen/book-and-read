require 'rails_helper'

describe UsersController do
  describe 'GET books' do
    it 'shows the books of the user' do
      user = FactoryGirl.create :user, :with_books
      get :books, user_id: user.id
      expect(assigns(:books)).to eq user.books
    end
  end
end
