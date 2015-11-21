require 'rails_helper'

describe BorrowRequestsController, type: :controller do
  let(:borrower) { create :user }
  let(:owner) { create :user, :with_books }
  let(:book_to_borrow) { owner.books.first }

  describe 'GET index' do
    skip
  end

  describe 'POST create' do
    it 'creates a new borrow request' do
      post :create, user_id: owner, requester_id: borrower, book_id: book_to_borrow
      expect(owner.reload.lent_requests.first).to be_truthy
      expect(owner.reload.lent_requests.first).to eq BorrowRequest.first
      expect(borrower.reload.borrow_requests.first).to eq BorrowRequest.first
    end
  end
end
