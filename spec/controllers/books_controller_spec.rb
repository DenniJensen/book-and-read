require 'rails_helper'

describe BooksController do
  it 'returns all books' do
    get :index
    FactoryGirl.create :book
    expect(response.status).to eq 200
  end

  it 'shows books in detail' do
    book = FactoryGirl.create :book
    get :show, id: book.id
    expect(response.status).to eq 200
    expect(assigns(:book)).to eq book
  end
end
