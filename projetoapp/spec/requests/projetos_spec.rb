require 'rails_helper'

RSpec.describe "Projetos", type: :request do
  describe "GET /projetos" do
    it "works! (now write some real specs)" do
      get projetos_path
      expect(response).to have_http_status(200)
    end
  end
end
