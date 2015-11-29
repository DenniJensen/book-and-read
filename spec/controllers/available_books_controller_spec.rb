require 'rails_helper'

describe AvailableBooksController do
  before do
    allow(controller).to receive(:authenticate_user!).and_return(true)
  end

  describe 'GET /books' do
    it 'show all books with in ownership' do
      books_owner = create :user, :with_books
      create :book
      get :index
      expect(assigns(:books).count).to eq books_owner.books.count
    end
  end
end
