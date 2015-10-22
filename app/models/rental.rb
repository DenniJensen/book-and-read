class Rental < ActiveRecord::Base
  belongs_to :book
  belongs_to :owner, class_name: 'User'
  belongs_to :borrower, class_name: 'User'
  validates :owner, :borrower, :book, :start, presence: true
end
