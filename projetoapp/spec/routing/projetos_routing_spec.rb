require "rails_helper"

RSpec.describe ProjetosController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/projetos").to route_to("projetos#index")
    end

    it "routes to #new" do
      expect(:get => "/projetos/new").to route_to("projetos#new")
    end

    it "routes to #show" do
      expect(:get => "/projetos/1").to route_to("projetos#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/projetos/1/edit").to route_to("projetos#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/projetos").to route_to("projetos#create")
    end

    it "routes to #update" do
      expect(:put => "/projetos/1").to route_to("projetos#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/projetos/1").to route_to("projetos#destroy", :id => "1")
    end

  end
end
