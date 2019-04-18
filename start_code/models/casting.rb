require_relative('../db/sql_runner.rb')

class Casting
  attr_reader :id, :star_id, :movies_id
  attr_accessor :fee

  def initialize(options)
    @star_id = options["star_id"].to_i
    @movie_id = options["movie_id"].to_i
    @fee = options["fee"].to_i
    @id = options["id"].to_i if options["id"]
  end

  def save()
    sql = "INSERT INTO castings(star_id, movie_id, fee) VALUES ($1, $2, $3) RETURNING id;"
    values =[ @star_id,@movie_id,@fee]
    results = SqlRunner.run(sql,values).first
    @id = results['id'].to_i
  end

  def update
    sql = " UPDATE castings SET fee = $1 WHERE id = $2"
    values = [@fee, @id]
    SqlRunner.run(sql, values )
  end

  def self.delete_all()
    sql = "DELETE FROM castings;"
    SqlRunner.run(sql)
  end

  def self.return_fees(movie)
    sql = "SELECT castings.fee FROM castings WHERE movie_id = $1;"
    values = [movie.id]
    results = SqlRunner.run(sql, values)
    results.map({})
  end

  def self.all()
    sql = "SELECT * FROM castings"
    results = SqlRunner.run(sql)
    casting = results.map{|casting| Casting.new(casting)}
  end

end
