require 'rails_helper'

describe BorrowRequestsController, type: :controller do
  let(:borrower) { create :user }
  let(:owner) { create :user, :with_books }
  let(:book_to_borrow) { owner.books.first }
  let(:borrow_request) do
    BorrowRequest.create(requester_id: borrower.id,
                         owner_id: owner.id,
                         book_id: book_to_borrow.id)
  end

  describe 'GET /users/:user_id/books/:id' do
    it 'returns all requests of the user' do
      borrow_request
      get :index, user_id: owner
      expect(assigns(:borrow_requests).count).to eq 0
      get :index, user_id: borrower
      expect(assigns(:borrow_requests).count).to eq 1
    end
  end

  describe 'POST /users/:user_id/books/:id' do
    it 'creates a new borrow request' do
      post :create, user_id: owner,
        requester_id: borrower, book_id: book_to_borrow
      expect(owner.reload.lent_requests.first).to be_truthy
      expect(owner.reload.lent_requests.first).to eq BorrowRequest.first
      expect(borrower.reload.borrow_requests.first).to eq BorrowRequest.first
    end
  end
end
