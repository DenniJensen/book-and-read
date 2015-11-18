require 'rails_helper'

describe BooksController do
  it 'returns all books' do
    create :book
    get :index
    expect(response.status).to eq 200
    expect(assigns(:books).count).to eq 1
  end

  it 'shows books in detail' do
    book = create :book
    get :show, id: book.id
    expect(response.status).to eq 200
    expect(assigns(:book)).to eq book
  end

  context 'book owners' do
    it 'shows all owners of the book' do
      user = create :user, :with_books
      get :owners, book_id: user.books.first.id
      expect(assigns(:users)).to eq [user]
    end
  end
end
