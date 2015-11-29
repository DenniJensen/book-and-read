require 'rails_helper'

describe RentalsController, type: :controller do
  it 'creates a new rental' do
    skip "Not triggering the controller method TODO"
    borrow_request = create :borrow_request
    expect(BorrowRequest.count).to eq 1
    post :create, borrow_request_id: borrow_request.id
    expect(BorrowRequest.count).to eq 0
    expect(Rental.count).to eq 1
  end
end
