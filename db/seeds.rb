# This file should contain all the record creation óeeded to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts 'Create categories'
[{
  id: 1,
  name: 'En Adopción'
},{
  id: 2,	
  name: 'Perdidos'
},{
  id: 3, 	
  name: 'Noticias'
},{
  name: 'Reencuentro',
}].each do |category_info|
  Category.create!({	
    id: category_info[:id],
    name: category_info[:name]
  })
end 

puts 'create Posts'
[{
  title: 'Castracion Rincon',
  body: 'Hay Castraciones gratuitas el horario es de 9 a 20hs es necesario estar temprano',
  category_id: 3  
 },{
  title: 'Castracion Santa Fe',
  body: 'Hay Castraciones gratuitas el horario es de 9 a 20hs es necesario estar temprano',
  category_id: 3  
 },{
  title: 'Vacunacion en la costa',
  body: 'Hay Castraciones gratuitas el horario es de 9 a 20hs es necesario estar temprano',
  category_id: 3  
 } 
].each do |post_info|
  Post.create!({	
    title: post_info[:title],
    body:  post_info[:body],
    category_id: post_info[:body]

  })
end 
