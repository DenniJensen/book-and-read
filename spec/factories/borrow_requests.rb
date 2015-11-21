FactoryGirl.define do
  factory :borrow_request do
    before(:create) do |request|
      request.requester = create(:user)
      request.owner = create(:user, :with_books)
      request.book = request.owner.books.first
    end
  end
end
