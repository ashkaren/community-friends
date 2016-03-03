# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Post.delete_all
Post.create!(title: 'Tiring And Boring Day',
  description: 
    %{<p>
       Today has been really long. Time  went by really slow and i left my lunch at home. FML 
      </p>},
  image_url:
       
# . . .
Post.create!(title: 'REALLY GRAY',
  description:
    %{<p>
        But its nice though
      </p>},
  image_url: 'gray.png'
))
