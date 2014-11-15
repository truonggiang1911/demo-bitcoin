# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
if Document.count == 0
	document = Document.new({name: "Ruby on Rails", price: 1.26})
	document.save

	document = Document.new({name: "Best Ruby", price: 2.26})
	document.save

	document = Document.new({name: "Rspec ", price: 6.66})
	document.save
end	
