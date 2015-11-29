FactoryGirl.define do
  factory :borrow_request do
    before(:create) do |request|
      request.requester_id = create(:user).id
      request.owner_id = create(:user, :with_books).id
      request.book_id = request.owner.books.first.id
    end
    borrow_start Date.new
    borrow_end  (Date.new + 5.days)
  end
end
