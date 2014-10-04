require 'rails_helper'

RSpec.describe RibbitsController, :type => :controller do
  describe "GET #index" do
    it "populates an array of ribbits" do
      ribbits = FactoryGirl.create(:ribbit)
      get :index
      expect(assigns(:ribbits)).to eq([ribbits])
    end

    it "renders the :index view" do
      get :index
      expect(response).to render_template(:index)
    end
  end
end
