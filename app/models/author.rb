class Author < ActiveRecord::Base
  has_and_belongs_to_many :books
  validates :name, presence: true, uniqueness: true

  has_many :books_authors
  has_many :books, through: :books_authors

  def to_s
    name
  end
end
