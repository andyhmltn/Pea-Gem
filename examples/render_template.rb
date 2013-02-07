require '../lib/pea'

values = {:phrase => 'world', :name => 'Cake'}

pea = Pea.new 'template.pea'

puts pea.render(values)