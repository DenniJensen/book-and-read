require 'rails_helper'

describe BorrowRequest, type: :model do
  let(:borrow_request) { create :borrow_request }

  it 'includes all partients' do
    expect(borrow_request.owner.lent_requests.first).to eq borrow_request
    expect(borrow_request.owner.borrow_requests).to eq []
    expect(borrow_request.requester.borrow_requests.first).to(
      eq borrow_request)
  end
end
