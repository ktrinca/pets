# This file should contain all the record creation óeeded to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts 'Create categories'
[{
  name: 'En Adopción'
},{
  name: 'Perdidos'
},{
  name: 'Informes'
},{
  name: 'Reencuentro',
}].each do |category_info|
  Category.create!({	
    name: category_info[:name]
  })
end 