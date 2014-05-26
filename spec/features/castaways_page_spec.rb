require 'spec_helper'

feature "Castaways page" do
	context "on page load" do
		before do
			visit root_path
		end
		scenario "all names should be displayed" do
			NAMES.each { |name| page.should have_content(name) }			
		end
	end
end
