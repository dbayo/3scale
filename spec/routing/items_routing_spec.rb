require "spec_helper"

describe ItemsController do
  describe "routing" do

    it "routes to #index" do
      get("/project/1/items").should route_to("items#index", project_id: "1")
    end

    it "routes to #new" do
      get("/project/1/items/new").should route_to("items#new", project_id: "1")
    end

    it "routes to #show" do
      get("/project/1/items/1").should route_to("items#show", project_id: "1", id: "1")
    end

    it "routes to #edit" do
      get("/project/1/items/1/edit").should route_to("items#edit", project_id: "1", id: "1")
    end

    it "routes to #create" do
      post("/project/1/items").should route_to("items#create", project_id: "1")
    end

    it "routes to #update" do
      put("/project/1/items/1").should route_to("items#update", project_id: "1", id: "1")
    end

    it "routes to #destroy" do
      delete("/project/1/items/1").should route_to("items#destroy", project_id: "1", id: "1")
    end

  end
end
