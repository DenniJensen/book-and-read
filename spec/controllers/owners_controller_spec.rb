require 'rails_helper'

describe OwnersController, type: :controller do
  before do
    allow(controller).to receive(:authenticate_user!).and_return(true)
  end

  let(:user_with_books) { create :user, :with_books }

  describe 'GET /books/:book_id/owners' do
    it 'shows all owners of the book' do
      book = user_with_books.books.first
      user_2 = create :user
      book.owners << user_2
      get :index, book_id: user_with_books.books.first.id
      expect(assigns(:users).count).to eq 2
      expect(assigns(:users).first).to eq user_with_books
      expect(assigns(:users).second).to eq user_2
    end
  end
end
