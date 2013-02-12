require 'spec_helper'

describe Pea do

	before :each do
		@pea = Pea.new
		@values = {:phrase => 'world'}
		@app_root = File.expand_path(File.dirname(__FILE__))

		Dir.chdir @app_root
	end

	describe "#new" do
		it "returns a Pea object" do
			@pea.should be_an_instance_of Pea
		end

		it "takes a relative file path and reads it" do
			pea_ = Pea.new 'templates/1.pea'

			pea_.contents.should eql 'Hello {phrase}'
		end

		it "takes a file path and reads it" do
			pea_ = Pea.new File.join(@app_root, "templates/1.pea")

			pea_.contents.should eql 'Hello {phrase}'
		end

		it "takes no file path and doesn't set contents" do
			@pea.contents.should be_nil
		end
	end

	describe "#render" do
		it "takes a file path and renders the view" do
			@pea.read File.join(@app_root, "templates/1.pea")
			@pea.render(@values).should eql 'Hello world'
		end

		it "reads a relative path" do
			@pea.read '../examples/template.pea'
			@pea.contents.should eql 'Hello {phrase}!'
		end

		it "takes a string and renders the correct view" do
			@pea.read_static 'Hello {phrase}!'
			@pea.render(@values).should eql 'Hello world!'
		end
	
		it "takes more than one value and renders the view" do
			@pea.read_static 'Hello {adjective} {phrase} from {name}'

			@values[:adjective] = 'beautiful'
			@values[:name] = 'RSpec'

			@pea.render(@values).should eql 'Hello beautiful world from RSpec'
		end

		it "allows method chaining" do
			pea_ = Pea.new().read_static('Hello {phrase}').render(@values)

			pea_.should eql 'Hello world'
		end

		it "should save the rendered string" do
			@pea.read 'templates/1.pea'
			@pea.render({:phrase => 'world'})

			@pea.rendered.should eql 'Hello world'
		end
	end

end