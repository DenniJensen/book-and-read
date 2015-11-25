require 'rails_helper'

describe BookOwnership, type: :model do
  it 'is linked to the onwer and the book' do
    expect(BookOwnership.all.count).to eq 0
    user = create :user, :with_books
    expect(BookOwnership.all.count).to eq 1
    expect(BookOwnership.first.owner).to eq user
    expect(BookOwnership.first.book).to eq user.books.first
  end

  context 'user cannot own one book twice' do
    it 'is unable to create same ownership' do
      user = create :user, :with_books
      expect(BookOwnership.all.count).to eq 1
      same_book = user.books.first
      created = BookOwnership.new(owner: user, book: same_book)
      expect(created.save).to be_falsy
    end
  end
end
