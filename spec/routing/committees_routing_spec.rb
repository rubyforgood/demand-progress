# frozen_string_literal: true

require "rails_helper"

RSpec.describe CommitteesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(get: "/committees").to route_to("committees#index")
    end

    it "routes to #new" do
      expect(get: "/committees/new").to route_to("committees#new")
    end

    it "routes to #show" do
      expect(get: "/committees/1").to route_to("committees#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/committees/1/edit").to route_to("committees#edit", id: "1")
    end

    it "routes to #create" do
      expect(post: "/committees").to route_to("committees#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/committees/1").to route_to("committees#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/committees/1").to route_to("committees#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/committees/1").to route_to("committees#destroy", id: "1")
    end

  end
end
