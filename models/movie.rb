require('pry')
require_relative('../db/SqlRunner')
require_relative('../models/star')

class Movie

  attr_reader :id
  attr_accessor :title, :genre, :budget

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @genre = options['genre']
    @budget = options['budget'].to_i
  end

  def save()
    sql = "INSERT INTO movies
    ( title, genre, budget )
    VALUES
    ( $1, $2, $3)
    RETURNING id;"
    values = [@title, @genre, @budget]
    @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end

  def update()
    sql = "UPDATE movies SET
    (title, genre, budget) =
    ($1, $2, $3)
    WHERE id = $4;"
    values = [@title, @genre, @budget, @id]
    SqlRunner.run(sql, values)
  end

  def display_all_stars()
    sql = "SELECT stars.* FROM stars
    INNER JOIN castings
    ON castings.star_id = stars.id
    WHERE
    movie_id = $1"
    values = [@id]
    stars = SqlRunner.run(sql,values)
    return stars.map { |star| Star.new(star)}
  end

  def budget_check()
    array = display_all_stars()
    fees = 0
      for star in array
        fees += star.fee
      end
    return self.budget - fees
  end

  def self.delete()
    sql = "DELETE FROM movies
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM movies"
    SqlRunner.run(sql)
  end


end
