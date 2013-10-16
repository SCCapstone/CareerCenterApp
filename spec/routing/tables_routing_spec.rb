require "spec_helper"

describe TablesController do
  describe "routing" do

    it "routes to #index" do
      get("/tables").should route_to("tables#index")
    end

    it "routes to #new" do
      get("/tables/new").should route_to("tables#new")
    end

    it "routes to #show" do
      get("/tables/1").should route_to("tables#show", :id => "1")
    end

    it "routes to #edit" do
      get("/tables/1/edit").should route_to("tables#edit", :id => "1")
    end

    it "routes to #create" do
      post("/tables").should route_to("tables#create")
    end

    it "routes to #update" do
      put("/tables/1").should route_to("tables#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/tables/1").should route_to("tables#destroy", :id => "1")
    end

  end
end
