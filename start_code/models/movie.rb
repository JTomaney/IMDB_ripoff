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

end
