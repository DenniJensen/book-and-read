require 'rails_helper'

describe BooksController do
  it 'returns all books' do
    FactoryGirl.create :book
    get :index
    expect(response.status).to eq 200
    expect(assigns(:books).count).to eq 1
  end

  it 'shows books in detail' do
    book = FactoryGirl.create :book
    get :show, id: book.id
    expect(response.status).to eq 200
    expect(assigns(:book)).to eq book
  end

  context 'book owners' do
    it 'shows all owners of the book' do
      skip
      book = FactoryGirl.create :book
    end
  end
end
