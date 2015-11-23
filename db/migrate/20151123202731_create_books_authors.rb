class CreateBooksAuthors < ActiveRecord::Migration
  def change
    create_table :books_authors do |t|
      t.belongs_to :book, index: true, foreign_key: true
      t.belongs_to :author, index: true, foreign_key: true
    end
  end
end
