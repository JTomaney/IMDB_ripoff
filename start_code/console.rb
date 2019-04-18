require('pry')
require_relative('models/star')
require_relative('./models/movie.rb')
require_relative('models/casting')

Casting.delete_all
Movie.delete_all
Star.delete_all

movie1 = Movie.new({'title'=> 'Some Like It Hot', 'genre' => 'Comedy', 'budget' => '1000000'})
movie1.save()

movie2 = Movie.new({'title'=> 'No Country For Old Men', 'genre' => 'Thriller', 'budget' => '20000000'})
movie2.save

star1 = Star.new({'first_name'=> 'Marilyn', 'last_name' => ' Munroe',})
star1.save()

star2 = Star.new({'first_name' => 'Josh', 'last_name'=> 'Brolin'})
star2.save

star3 = Star.new({'first_name' => 'Woody', 'last_name'=> 'Harrelson'})
star3.save


casting1 = Casting.new({'star_id' => star1.id, 'movie_id'=> movie1.id, 'fee' => '100000'})
casting1.save()

casting2 = Casting.new({'star_id'=> star2.id, 'movie_id'=> movie2.id, 'fee'=> '2000000'})
casting2.save()

casting3 = Casting.new({'star_id'=> star3.id, 'movie_id'=> movie2.id, 'fee'=> '5000000'})
casting3.save()


movie1.title = "Some Might Like It Hot?"
movie1.update()

casting1.fee = '20000'
casting1.update()

star1.last_name ='Monnroaae'
star1.update

# Movie.calculate_remaining_budget(movie2)

Casting.return_fees(movie2)

movie1.all_stars
star1.all_movies
binding.pry
nil
# Movie.all()
# p Star.all()
# p Casting.all()
