class Book < ActiveRecord::Base
  has_and_belongs_to_many :authors
  has_and_belongs_to_many :owners, class_name: 'User'
  validates :title, :isbn, presence: true
  validates :isbn, uniqueness: { scope: :isbn_13 }, length: { in: 10..13 }
end
