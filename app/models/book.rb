class Book < ActiveRecord::Base
  has_and_belongs_to_many :authors

  has_many :book_ownerships
  has_many :owners, through: :book_ownerships

  validates :title, :isbn, presence: true
  validates :isbn, uniqueness: { scope: :isbn_13 }, length: { in: 10..13 }
end
