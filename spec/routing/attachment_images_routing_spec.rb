require "rails_helper"

RSpec.describe AttachmentImagesController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/attachment_images").to route_to("attachment_images#index")
    end

    it "routes to #new" do
      expect(:get => "/attachment_images/new").to route_to("attachment_images#new")
    end

    it "routes to #show" do
      expect(:get => "/attachment_images/1").to route_to("attachment_images#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/attachment_images/1/edit").to route_to("attachment_images#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/attachment_images").to route_to("attachment_images#create")
    end

    it "routes to #update" do
      expect(:put => "/attachment_images/1").to route_to("attachment_images#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/attachment_images/1").to route_to("attachment_images#destroy", :id => "1")
    end

  end
end
