require_relative('../models/casting')
require_relative('../models/movie')
require_relative('../models/star')
require("pry-byebug")

Casting.delete_all()
Movie.delete_all()
Star.delete_all()

  movie1 = Movie.new({'title' => 'CodeClan IV: The Beginning', 'genre' => 'space coding opera', 'budget' => '4'})
  movie2 = Movie.new({'title' => 'CodeClan V: Return of the Hackers', 'genre' => 'sports com romp', 'budget' => '100'})
  movie3 = Movie.new({'title' => 'CodeClan VI: Empire Hacks Back', 'genre' => 'historical documentary', 'budget' => '90'})

movie1.save()
movie2.save()
movie3.save()

  star1 = Star.new({'first_name' => 'Eugene', 'last_name' => 'Pitt', 'fee' => '2'})
  star2 = Star.new({'first_name' => 'Juan', 'last_name' => 'Aniston', 'fee' => '1'})
  star3 = Star.new({'first_name' => 'John', 'last_name' => 'McGregor', 'fee' => '8'})
  star4 = Star.new({'first_name' => 'Sandy', 'last_name' => 'Portman', 'fee' => '10'})

star1.save()
star2.save()
star3.save()
star4.save()

casting1 = Casting.new({'movie_id' => movie1.id, 'star_id' => star1.id})
casting2 = Casting.new({'movie_id' => movie1.id, 'star_id' => star2.id})
casting3 = Casting.new({'movie_id' => movie2.id, 'star_id' => star2.id})
casting4 = Casting.new({'movie_id' => movie2.id, 'star_id' => star1.id})
casting5 = Casting.new({'movie_id' => movie3.id, 'star_id' => star2.id})
casting6 = Casting.new({'movie_id' => movie3.id, 'star_id' => star1.id})
casting7 = Casting.new({'movie_id' => movie2.id, 'star_id' => star3.id})
casting8 = Casting.new({'movie_id' => movie2.id, 'star_id' => star4.id})
casting9 = Casting.new({'movie_id' => movie3.id, 'star_id' => star3.id})

casting1.save
casting2.save
casting3.save
casting4.save
casting5.save
casting6.save
casting7.save
casting8.save
casting9.save


binding.pry
nil
