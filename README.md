Pea-Gem
=======

A small templating gem!

I built this while learning ruby last year. It's a really simple gem for barebones templates like so:

	Hello {phrase}!

Getting Started
--------

First off install the gem with `gem install pea`. Then use it like so:

	require 'pea'

	values = {:phrase => 'world', :name => 'Cake'}

	my_template = Pea.new 'template.pea', File.dirname(__FILE__)

The file `template.pea` (or any name of your choice) should be readable and at the relative path specified. This example will contain:

	Hello {phrase} my name is {name}!

Then just render it like so:

	puts my_template.render(values) #=> Hello world my name is Cake!

Rendering from a string
----------

You can also render directly from a string. Example:
	
	require 'pea'

	values = {:phrase => 'World!'}

	my_template = Pea.new().read_static('Hello {phrase}').render(values)

Enjoy!