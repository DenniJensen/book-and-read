class Author < ActiveRecord::Base
  has_and_belongs_to_many :books
  validates :name, presence: true, uniqueness: true,
            format: { with: /\A[a-zA-Z]+\z/, message: "Letters allowed only" }
end
