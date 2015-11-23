class Book < ActiveRecord::Base
  has_and_belongs_to_many :authors

  has_many :book_ownerships
  has_many :owners, through: :book_ownerships

  has_many :books_authors
  has_many :authors, through: :books_authors

  validates :title, :isbn, presence: true
  validates :isbn, uniqueness: { scope: :isbn_13 }, length: { in: 10..13 }

  def self.search(search)
    return all unless search
    where("title like ?", "%#{search}%")
  end

  def self.available
    joins(:book_ownerships).where.not(book_ownerships: { user_id: nil })
  end

  def available?
    owners.count > 0
  end
end
