require 'rails_helper'

describe BorrowRequest, type: :model do
  let(:borrow_request) { create :borrow_request }

  it 'includes all partients' do
    expect(borrow_request.owner.lent_requests.first).to eq borrow_request
    expect(borrow_request.owner.borrow_requests).to eq []
    expect(borrow_request.requester.borrow_requests.first).to(
      eq borrow_request)
  end

  context 'borrow request on same user with same book' do
    it 'cannot create a second borrow request' do
      requester = borrow_request.requester
      owner = borrow_request.owner
      book = borrow_request.book
      new_request = BorrowRequest.new(requester: requester,
                                     owner: owner,
                                     book: book)
      expect(new_request.save).to be_falsy
    end
  end
end
