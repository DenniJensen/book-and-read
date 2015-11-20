require 'rails_helper'

describe BooksController do
  let(:user_with_books) { create :user, :with_books }

  describe 'GET /books' do
    it 'returns all books' do
      books = [create(:book)]
      books << create(:book)
      books << create(:book)
      get :all_books
      expect(response.status).to eq 200
      expect(assigns(:books)).to eq books
    end
  end

  describe 'GET /user/:user_id/books/:id' do
    it 'shows books in detail' do
      book = create :book
      get :show, id: book.id
      expect(response.status).to eq 200
      expect(assigns(:book)).to eq book
    end
  end

  describe 'GET /books/:book_id/owners' do
    it 'shows all owners of the book' do
      book = user_with_books.books.first
      user_2 = create :user
      book.owners << user_2
      get :owners, book_id: user_with_books.books.first.id
      expect(assigns(:users).count).to eq 2
      expect(assigns(:users).first).to eq user_with_books
      expect(assigns(:users).second).to eq user_2
    end
  end

  describe 'GET user/:user_id/books' do
    it 'shows the books of the user' do
      user_with_books
      create :book
      get :index, user_id: user_with_books.id
      expect(assigns(:books)).to eq user_with_books.books
    end
  end
end
