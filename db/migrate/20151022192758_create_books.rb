class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :subtitle
      t.date :published_at
      t.string :description
      t.string :language
      t.string :image_link
      t.integer :pages
      t.string :isbn
      t.string :isbn_13

      t.timestamps null: false
    end
  end
end
