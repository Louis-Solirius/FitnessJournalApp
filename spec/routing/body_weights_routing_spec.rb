require "rails_helper"

RSpec.describe BodyWeightsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/body_weights").to route_to("body_weights#index")
    end

    it "routes to #new" do
      expect(get: "/body_weights/new").to route_to("body_weights#new")
    end

    it "routes to #show" do
      expect(get: "/body_weights/1").to route_to("body_weights#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/body_weights/1/edit").to route_to("body_weights#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/body_weights").to route_to("body_weights#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/body_weights/1").to route_to("body_weights#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/body_weights/1").to route_to("body_weights#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/body_weights/1").to route_to("body_weights#destroy", id: "1")
    end
  end
end
