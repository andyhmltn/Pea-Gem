require File.expand_path('../lib/pea.rb', __FILE__) 

Gem::Specification.new do |s|
  s.name        = 'pea'
  s.version     = Pea::Version.to_s
  s.summary     = "A very simple templating library!"
  s.description = "You can simply provide Pea with a file and a hash of values and pea will return the contents of the file with the hash keys replaced with the values"
  s.authors     = ["Andy Hamilton"]
  s.email       = 'andyhmltn@gmail.com'
  s.files       = ["lib/pea.rb"]
  s.homepage    = 'http://rubygems.org/gems/pea'
end