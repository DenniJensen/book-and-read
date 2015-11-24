class BorrowRequest < ActiveRecord::Base
  belongs_to :book
  belongs_to :place

  belongs_to :owner, class_name: User
  belongs_to :requester, class_name: User

  validates :owner, uniqueness: { scope: [:book, :requester] }

  private

  def check_dates
    borrow_start < borrow_end
  end
end
