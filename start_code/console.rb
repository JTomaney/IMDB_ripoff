require('pry')
require_relative('models/star')
require_relative('./models/movie.rb')
require_relative('models/casting')

Casting.delete_all
Movie.delete_all
Star.delete_all

movie1 = Movie.new({'title'=> 'Some Like It Hot', 'genre' => 'Comedy'})
movie1.save()

star1 = Star.new({'first_name'=> 'Marilyn', 'last_name' => ' Munroe'})
star1.save()

casting1 = Casting.new({'star_id' => star1.id, 'movie_id'=> movie1.id, 'fee' => '100000'})
casting1.save()

movie1.title = "Some Might Like It Hot?"
movie1.update

casting1.fee = '20000'
casting1.update

star1.last_name ='Monnroaae'
star1.update
# Movie.all()
# p Star.all()
# p Casting.all()
