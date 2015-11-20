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

  context 'Add/Remove Books' do
    describe 'POST user/:user_id/books/:id' do
      it 'adds a book to the user' do
        book = create :book
        user = create :user
        expect(user.books).to eq []
        expect(book.owners).to eq []
        post :add_book_to_user, user_id: user.id, id: book.id
        expect(user.reload.books).to eq [book]
        expect(book.reload.owners).to eq [user]
      end
    end

    describe 'PUT user/:user_id/books/:id' do
      it 'removes the book from the user' do
        book_to_remove = user_with_books.books.first
        expect(user_with_books.books.include? book_to_remove).to be_truthy
        put :remove_book_from_user, user_id: user_with_books.id,
          id: book_to_remove.id
        included = user_with_books.reload.books.include? book_to_remove
        expect(included).to be_falsy
      end
    end
  end
end
