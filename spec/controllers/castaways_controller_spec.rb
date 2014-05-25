require 'spec_helper'

describe CastawaysController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
		it "uses a new team" do
			get :index
			assigns(:team).should be_new_record 
		end
		it "has access to the global NAMES constant" do
			get :index
			NAMES.length.should be(64)
		end
  end

  describe "GET 'recruit'" do
    it "returns http success" do
      get 'recruit'
      response.should be_success
    end
  end

end
