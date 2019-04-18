require_relative('../db/sql_runner.rb')

class Movie
  attr_reader :id
  attr_accessor :title, :genre

  def initialize(options)
    @title = options["title"]
    @genre = options["genre"]
    @id = options["id"].to_i if options["id"]
  end

  def save()
    sql = "INSERT INTO movies(title,genre) VALUES ($1, $2) RETURNING id;"
    values =[ @title, @genre]
    results = SqlRunner.run(sql,values).first
    @id = results['id'].to_i
  end

  def update
    sql = " UPDATE movies SET (title, genre) = ($1,$2) WHERE id = $3"
    values = [@title, @genre, @id]
    SqlRunner.run(sql, values )
  end

  def self.delete_all()
    sql = "DELETE FROM movies;"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM movies"
    results = SqlRunner.run(sql)
    movies = results.map{|movie| Movie.new(movie)}
    return movies
  end




end
