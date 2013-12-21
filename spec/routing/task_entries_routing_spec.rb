require "spec_helper"

describe TaskEntriesController do
  describe "routing" do

    it "routes to #index" do
      get("/task_entries").should route_to("task_entries#index")
    end

    it "routes to #new" do
      get("/task_entries/new").should_not route_to("task_entries#new")
    end

    it "routes to #show" do
      get("/task_entries/1").should route_to("task_entries#show", :id => "1")
    end

    it "routes to #edit" do
      get("/task_entries/1/edit").should_not route_to("task_entries#edit", :id => "1")
    end

    it "routes to #create" do
      post("/task_entries").should route_to("task_entries#create")
    end

    it "routes to #update" do
      put("/task_entries/1").should route_to("task_entries#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/task_entries/1").should route_to("task_entries#destroy", :id => "1")
    end

  end
end
