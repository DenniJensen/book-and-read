require "rails_helper"

describe BorrowRequestsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/users/1/borrow_requests").to route_to(
        controller: 'borrow_requests',
        action: 'index',
        user_id: '1')
    end

    it "routes to #show" do
      expect(get: "/users/1/borrow_requests/1").to route_to(
        controller: 'borrow_requests',
        action: 'show',
        user_id: '1',
        id: '1')
    end

    it "routes to #create" do
      expect(post: "/borrow_requests").to route_to(
        controller: 'borrow_requests',
        action: 'create')
    end

    context 'via PUT' do
      it "routes to #update" do
        expect(put: "/users/1/borrow_requests/1").to route_to(
          controller: 'borrow_requests',
          action: 'update',
          user_id: '1',
          id: '1')
      end
    end

    context 'via PATCH' do
      it "routes to #update" do
        expect(patch: "/users/1/borrow_requests/1").to route_to(
          controller: 'borrow_requests',
          action: 'update',
          user_id: '1',
          id: '1')
      end
    end

    it 'routes to #new' do
      expect(get: "/users/1/books/2/borrow_requests/new").to route_to(
        controller: 'borrow_requests',
        action: 'new',
        user_id: '1',
        book_id: '2')
    end

    it "routes to #destroy" do
      expect(delete: "users/1/borrow_requests/3").to route_to(
        controller: 'borrow_requests',
        action: 'destroy',
        user_id: '1',
        id: '3')
    end
  end
end
