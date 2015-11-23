class ChangeDataTypeForBooks < ActiveRecord::Migration
  def change
    change_column :books, :description, :text
    change_column :books, :subtitle, :text
  end
end
