class CreateBorrowRequests < ActiveRecord::Migration
  def change
    create_table :borrow_requests do |t|
      t.belongs_to :requester, class_name: 'User'
      t.belongs_to :owner, class_name: 'User'
      t.date :borrow_start
      t.date :borrow_end
      t.belongs_to :book
      t.belongs_to :place

      t.timestamps null: false
    end
  end
end
