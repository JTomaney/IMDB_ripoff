require('pry')
require_relative('models/star')
require_relative('./models/movie.rb')
require_relative('models/casting')

movie1 = Movie.new({'title'=> 'Some Like It Hot', 'genre' => 'Comedy'})
movie1.save()
