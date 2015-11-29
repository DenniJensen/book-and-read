require "rails_helper"

describe RentalsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/users/1/rentals").to route_to(
        controller: 'rentals',
        action: 'index',
        user_id: '1')
    end

    it "routes to #show" do
      expect(get: "/users/1/rentals/1").to route_to(
        controller: 'rentals',
        action: 'show',
        user_id: '1',
        id: '1')
    end

    it "routes to #destroy" do
      expect(delete: "users/1/rentals/1").to route_to(
        controller: 'rentals',
        action: 'destroy',
        user_id: '1',
        id: '1')
    end

    it "routes to #create" do
      expect(post: "/rentals").to route_to(
        controller: 'rentals',
        action: 'create')
    end
  end
end
