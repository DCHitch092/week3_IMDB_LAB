require('pry')
require_relative('../db/SqlRunner')
require_relative('../models/star')
require_relative('../models/movie')

class Casting

  attr_reader :id, :movie_id, :star_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @movie_id = options['movie_id'].to_i
    @star_id = options['star_id'].to_i
  end

  def save()
    sql = "INSERT INTO castings
    (movie_id, star_id)
    VALUES ($1, $2)
    RETURNING id;"
    values = [@movie_id, @star_id]
    casting = SqlRunner.run( sql, values)
    @id = casting.first['id'].to_i
  end

  def update()
    sql = "UPDATE casting
    SET
    ( movie_id, star_id)
    =
    ($1, $2)
    WHERE id = $3"
    values = [@movie_id, @star_id,@id]
    SqlRunner.run(sql, values)
  end

  def self.delete()
    sql = "DELETE FROM castings
    WHERE id = $1"
    values = [@id]
    SqlRunner.run( sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM castings"
    SqlRunner.run(sql)
  end

end
