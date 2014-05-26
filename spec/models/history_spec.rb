require 'spec_helper'

describe History do
	before { @history = History.create }

	it { should respond_to(:popularity) }
	it { should respond_to(:total) }
	its(:total) { should be(0) }
	
	describe "popularity" do
		it "should correctly initialize the popularity on create" do
			NAMES.each { |name| @history[:popularity][name].should eq 0 }
		end
		it "should be able to be added to" do
			name = "Adalyn"
			@history.add_name(name)
			@history[:popularity][name].should eq 1
		end
	end
	describe "total" do
		it "should increment when a name is added." do
			expect do
				name = "Jayden"
				@history.add_name(name)
				@history.reload
			end.to change(@history, :total).by(1)
		end
	end
	describe "calculating the most popular names" do
		before do
			NAMES.each { |name| @history.add_name(name) }
			@popular_names = NAMES[10...20]
			@popular_names.each { |pop| @history.add_name(pop) }
			@popular_names.sort!
		end
		it "should give the correct names" do
			returned_names = @history.most_popular.map { |name| name[0] }.sort
			returned_names.should eq @popular_names
		end
		it "should give the correct counts" do
			returned_counts = @history.most_popular.map { |name| name[1] }.sort
			returned_counts.should eq Array.new(10, 2)
		end
	end
end
