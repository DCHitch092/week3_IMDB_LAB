require('pry')
require_relative('../db/SqlRunner')
require_relative('../models/casting')

class Star

  attr_reader :id
  attr_accessor :first_name, :last_name, :fee

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
    @fee = options['fee'].to_i
  end

  def save()
    sql = "INSERT INTO stars
    ( first_name, last_name, fee)
    VALUES
    ($1, $2, $3)
    RETURNING id"
    values = [@first_name, @last_name, @fee]
    star = SqlRunner.run( sql, values)
    @id = star.first['id'].to_i
  end

  def update()
    sql = "UPDATE stars
    SET
    ( first_name, last_name, fee)
    =
    ( $1, $2, $3)
    WHERE id = $4"
    values = [@first_name, @last_name, @fee, @id]
    SqlRunner.run( sql, values)
  end

  def display_all_movies()
    sql = "SELECT movies.* from movies
    INNER JOIN castings
    ON castings.movie_id = movies.id
    WHERE star_id = $1"
    values = [@id]
    movies = SqlRunner.run( sql, values)
    return movies.map { |movie| Movie.new(movie)}
  end


  def self.delete()
    sql = "DELETE FROM stars
    WHERE id = $1"
    values = [@id]
    SqlRunner.run( sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM stars"
    SqlRunner.run( sql)
  end

end
