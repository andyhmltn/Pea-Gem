require_relative '../lib/pea'
require 'yaml'

RSpec.configure do |config|
	# Enable colour
	config.color_enabled = true
	config.tty = true

	config.formatter = :documentation
end