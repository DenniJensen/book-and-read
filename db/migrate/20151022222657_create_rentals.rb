class CreateRentals < ActiveRecord::Migration
  def change
    create_table :rentals do |t|
      t.date :start
      t.date :end
      t.belongs_to :owner, class_name: 'User'
      t.belongs_to :borrower, class_name: 'User'
      t.belongs_to :book

      t.timestamps null: false
    end
  end
end
