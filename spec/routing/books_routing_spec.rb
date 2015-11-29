require "rails_helper"

describe BooksController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/users/1/books").to route_to(
        controller: 'books',
        action: 'index',
        user_id: '1')
    end

    it "routes to #show" do
      expect(get: "/users/1/books/1").to route_to(
        controller: 'books',
        action: 'show',
        user_id: '1',
        id: '1')
      expect(get: "/books/1").to route_to(
        controller: 'books',
        action: 'show',
        id: '1')
    end

    it "routes to #create" do
      expect(post: "/users/1/books").to route_to(
        controller: 'books',
        user_id: '1',
        action: 'create')
    end

    it 'routes to #new' do
      expect(get: "/users/1/books/new").to route_to(
        controller: 'books',
        action: 'new',
        user_id: '1')
    end

    it "routes to #destroy" do
      expect(delete: "users/1/rentals/1").to route_to(
        controller: 'rentals',
        action: 'destroy',
        user_id: '1',
        id: '1')
    end
  end
end
