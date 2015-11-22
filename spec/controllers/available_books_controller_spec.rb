require 'rails_helper'

describe AvailableBooksController do
  describe 'GET /books' do
    it 'show all books with in ownership' do
      books_owner = create :user, :with_books
      create :book
      get :index
      expect(assigns(:books).count).to eq books_owner.books.count
    end
  end
end
