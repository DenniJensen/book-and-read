ActiveRecord::Schema.define(version: 20151121221256) do

  create_table "authors", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "authors_books", id: false, force: :cascade do |t|
    t.integer "book_id",   null: false
    t.integer "author_id", null: false
  end

  add_index "authors_books", ["book_id", "author_id"], name: "index_authors_books_on_book_id_and_author_id"

  create_table "book_ownerships", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "book_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "book_ownerships", ["book_id"], name: "index_book_ownerships_on_book_id"
  add_index "book_ownerships", ["user_id"], name: "index_book_ownerships_on_user_id"

  create_table "books", force: :cascade do |t|
    t.string   "title"
    t.string   "subtitle"
    t.date     "published_at"
    t.string   "description"
    t.string   "language"
    t.string   "image_link"
    t.integer  "pages"
    t.string   "isbn"
    t.string   "isbn_13"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "borrow_requests", force: :cascade do |t|
    t.integer  "requester_id"
    t.integer  "owner_id"
    t.date     "borrow_start"
    t.date     "borrow_end"
    t.integer  "book_id"
    t.integer  "place_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "places", force: :cascade do |t|
    t.float    "longitude"
    t.float    "latitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rentals", force: :cascade do |t|
    t.date     "start"
    t.date     "end"
    t.integer  "owner_id"
    t.integer  "borrower_id"
    t.integer  "book_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "provider"
    t.string   "uid"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["provider"], name: "index_users_on_provider"
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["uid"], name: "index_users_on_uid"

end
