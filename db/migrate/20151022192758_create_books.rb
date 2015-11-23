class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.text :title
      t.text :subtitle
      t.string :published_at
      t.text :description
      t.string :language
      t.string :image_link
      t.integer :pages
      t.string :isbn
      t.string :isbn_13
    end
  end
end
