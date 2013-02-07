require 'spec_helper'

describe Pea do

	before :each do
		@pea = Pea.new
		@values = {:phrase => 'world'}
		@app_root = File.expand_path(File.dirname(__FILE__))
	end

	describe "#new" do
		it "returns a Pea object" do
			@pea.should be_an_instance_of Pea
		end
	end

	describe "#rende" do
		it "takes a file path and renders the view" do
			@pea.read File.join(@app_root, "templates/1.pea")
			@pea.render(@values).should eql 'Hello world'
		end

		it "takes a string and renders the correct view" do
			@pea.read_static 'Hello {phrase}'
			@pea.render(@values).should eql 'Hello world'
		end
	
		it "takes more than one value and renders the view" do
			@pea.read_static 'Hello {adjective} {phrase} from {name}'

			@values[:adjective] = 'beautiful'
			@values[:name] = 'RSpec'

			@pea.render(@values).should eql 'Hello beautiful world from RSpec'
		end
	end

end