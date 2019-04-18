class Casting
  attr_reader :id, :star_id, :movies_id
  attr_accessor :fee

  def initialize(options)
    @star_id = options["star_id"].to_i
    @movie_id = options["movie_id"].to_i
    @fee = options["fee"].to_i
    @id = options["id"].to_i if options["id"]
  end

end
