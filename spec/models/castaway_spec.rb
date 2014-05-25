require 'spec_helper'

describe Castaway do
	it { should respond_to(:name) }
	it { should be_embedded_in(:team) } 
	it { should validate_presence_of(:name) }
end
