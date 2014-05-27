require 'spec_helper'

feature "Castaways page" do
	context "on page load" do
		before do
			visit root_path
		end
		scenario { page.should have_selector("#intro") }
	end
	describe "the index page", js: true do
		before do
			visit root_path
			click_link 'Begin'
		end
		xscenario "all names should be displayed" do
			NAMES.each { |name| page.should have_content(name) }			
		end
	end
	describe "the game over page" do
		before do
			visit root_path
			click_link 'Begin'
			click_link 'Done'
		end
		xscenario { page.should have_selector("#game-over") }
		xscenario { page.should have_link("Choose Again") }
		xscenario { page.should have_link("Intro") }
	end
end
