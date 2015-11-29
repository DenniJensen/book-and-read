require 'rails_helper'

describe BorrowRequestsController, type: :controller do
  before do
    allow(controller).to receive(:authenticate_user!).and_return(true)
    allow(controller).to receive(:current_user).and_return(borrower)
  end

  let(:borrower) { create :user }
  let(:owner) { create :user, :with_books }
  let(:book_to_borrow) { owner.books.first }
  let(:borrow_request) do
    BorrowRequest.create(requester_id: borrower.id,
                         owner_id: owner.id,
                         book_id: book_to_borrow.id,
                         borrow_start: Date.new,
                         borrow_end: Date.new)
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
      new_borrow_request = {
        owner_id: owner,
        requester_id: borrower,
        book_id: book_to_borrow,
        borrow_start: Date.new,
        borrow_end: Date.new
      }
      post :create, borrow_request: new_borrow_request
      expect(owner.reload.lent_requests.first).to be_truthy
      expect(owner.reload.lent_requests.first).to eq BorrowRequest.first
      expect(borrower.reload.borrow_requests.first).to eq BorrowRequest.first
    end
  end
end
