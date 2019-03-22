require_relative('../db/sql_runner.rb')

class Tour
  attr_reader :id
  attr_accessor :max_capacity, :current_spaces_booked, :difficulty, :start_date, :location, :description, :photo, :tour_leader

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @max_capacity = options['max_capacity'].to_i
    @current_spaces_booked = options['current_spaces_booked'].to_i
    @difficulty = options['difficulty'].to_i
    @start_date = options['start_date']
    @location = options['location']
    @description = options['description']
    @photo = options['photo']
    @tour_leader = options['tour_leader']
  end

  def save
    sql = 'INSERT INTO tours (max_capacity, current_spaces_booked, difficulty, start_date, location, description, photo, tour_leader) VALUES ($1, $2, $3, $4, $5, $6, $7, $8) RETURNING id'

    values = [@max_capacity, @current_spaces_booked, @difficulty, @start_date, @location, @description, @photo, @tour_leader]

    results = SqlRunner.run(sql, values)
    @id = results.first['id'].to_i
  end

  def delete
    sql = 'DELETE FROM tours WHERE id = $1'
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def update
    sql = 'UPDATE tours SET (max_capacity, current_spaces_booked, difficulty, start_date, location, description, photo, tour_leader) = ($1, $2, $3, $4, $5, $6, $7, $8) WHERE id = $9'
    values = [@max_capacity, @current_spaces_booked, @difficulty, @start_date, @location, @description, @photo, @tour_leader, @id]
    SqlRunner.run(sql, values)
  end

  def self.all
    sql = 'SELECT * FROM tours'
    results = SqlRunner.run(sql)
    return results.map { |tour| Tour.new(tour)  }
  end

  def self.find(id)
    sql = "SELECT * FROM tours
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run( sql, values )
    return Tour.new( results.first )
  end

  def self.delete_all
    sql = 'DELETE FROM tours'
    SqlRunner.run(sql)
  end

end
