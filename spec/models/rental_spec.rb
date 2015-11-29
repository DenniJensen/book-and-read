require 'rails_helper'

describe Rental, type: :model do
  it 'creates a rental from a borrow request' do
    expect(Rental.all.count).to eq 0
    borrow_request = create(:borrow_request)
    Rental.from(borrow_request.id)
    expect(Rental.all.count).to eq 1
  end
end
