class Rental < ActiveRecord::Base
  belongs_to :book
  belongs_to :owner, class_name: 'User'
  belongs_to :borrower, class_name: 'User'
  validates :owner, :borrower, :book, :start, presence: true

  def self.from(borrow_request_id)
    borrow_request = BorrowRequest.find(borrow_request_id)
    create(
      book: borrow_request.book,
      owner: borrow_request.owner,
      borrower: borrow_request.requester,
      start: borrow_request.borrow_start,
      end: borrow_request.borrow_end
    )
  end
end
