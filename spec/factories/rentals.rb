FactoryGirl.define do
  factory :rental do
    before(:create) do |rental|
      rental.borrower = create(:user)
      rental.owner = create(:user, :with_books)
      rental.book = request.owner.books.first
      rental.start = DateTime.now
      rental.end = DateTime.now + 5
    end
  end
end
