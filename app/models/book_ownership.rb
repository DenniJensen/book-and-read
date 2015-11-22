class BookOwnership < ActiveRecord::Base
  belongs_to :owner, class_name: 'User', foreign_key: 'user_id'
  belongs_to :book
end
