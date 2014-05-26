require 'spec_helper'

describe CastawaysController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
			response.should render_template('index')
    end
		it "has access to the global NAMES constant" do
			get :index
			NAMES.length.should be(64)
		end
  end

  describe "POST 'recruit'" do


		context "when fed a team" do
			let!(:team) { Team.create }
			#let!(:castaway) { team.castaways.create(name: 'Tester', team: team) }
			let!(:castaway) { FactoryGirl.attributes_for(:castaway, team: team) }

			it "returns http success" do
				post :recruit, team_id: team.id, castaway: castaway, format: 'js'
				response.should be_success
			end
			it "should access the correct team" do
				post :recruit, team_id: team, castaway: castaway, format: 'js'
				assigns(:team).should eq team
			end
			it "should render the js template" do
				post :recruit, team_id: team, castaway: castaway, format: 'js'
				response.should render_template('recruit')
			end
			it "should create the correct castaway" do
				post :recruit, team_id: team, castaway: castaway, format: 'js'
				assigns(:castaway).name.should eq castaway[:name]
			end
		end
  end

end
