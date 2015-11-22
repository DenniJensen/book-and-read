require 'rails_helper'

describe User, type: :model do
  let(:user_with_books) { create :user, :with_books }
  let(:user) { create :user }

  describe '.books' do
    it 'returns the books of the user' do
      expect(user_with_books.books.count).to eq Book.all.count
    end
  end

  context 'borrow_request given' do
    before(:each) do
      BorrowRequest.create(requester: user,
                           owner: user_with_books,
                           book: user_with_books.books.first)
    end

    describe '.borrow_requests' do
      it 'returns the borrow requests' do
        expect(BorrowRequest.all.count).to eq 1
        expect(user_with_books.reload.borrow_requests.count).to eq 0
        expect(user.reload.borrow_requests.count).to eq 1
      end
    end

    describe '.lent_requests' do
      it 'returns no lent request' do
        expect(BorrowRequest.all.count).to eq 1
        expect(user_with_books.reload.lent_requests.count).to eq 1
      end
    end
  end
end
