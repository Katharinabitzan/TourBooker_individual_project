require_relative('../db/sql_runner.rb')
require( 'pry-byebug' )
require( 'date')

class Tour
  attr_reader :id
  attr_accessor :name, :max_capacity, :duration, :difficulty, :start_date, :location, :description, :photo, :tour_leader

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @max_capacity = options['max_capacity'].to_i
    @duration = options['duration'].to_i
    @difficulty = options['difficulty'].to_i
    @start_date = options['start_date']
    @location = options['location']
    @description = options['description']
    @photo = options['photo']
    @tour_leader = options['tour_leader']
  end

  def save
    sql = 'INSERT INTO tours (name, max_capacity, duration, difficulty, start_date, location, description, photo, tour_leader)
          VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9) RETURNING id'

    values = [@name, @max_capacity, @duration, @difficulty, @start_date, @location, @description, @photo, @tour_leader]

    results = SqlRunner.run(sql, values)
    @id = results.first['id'].to_i
  end

  def delete
    sql = 'DELETE FROM tours
          WHERE id = $1'
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def update
    sql = 'UPDATE tours
          SET (name, max_capacity, duration, difficulty, start_date, location, description, photo, tour_leader) = ($1, $2, $3, $4, $5, $6, $7, $8, $9)
          WHERE id = $10'
    values = [@name, @max_capacity, @duration, @difficulty, @start_date, @location, @description, @photo, @tour_leader, @id]
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

## Extension methods ##
  def spaces_remaining
    return @max_capacity - current_bookings.to_i()
  end

  def members
    sql = 'SELECT members.*
          FROM members INNER JOIN bookings
          ON bookings.member_id = members.id
          WHERE bookings.tour_id = $1;'
    values = [@id]
    result = SqlRunner.run(sql, values)
    return result.map { |member| Member.new(member)  }
  end

  def self.order_by_date
    sql = "SELECT * FROM tours
    ORDER BY start_date ASC;"
    results = SqlRunner.run( sql )
    return results.map { |tour| Tour.new(tour) }
  end


  def members_with_high_enough_ability
    sql = 'SELECT members.*
          FROM members, tours
          WHERE members.ability >= tours.difficulty
          AND tours.id = $1'
    values = [@id]
    result = SqlRunner.run(sql, values)
    return result.map { |member| Member.new(member)  }
  end

  def members_bookable_on_tour?
    tour = Tour.find(@id)
    array_ability_ok = members_with_high_enough_ability()
    for member in array_ability_ok
      if member.is_member_booked_on_tour?(tour) == true
        array_ability_ok.delete(member)
      end
    end
    return array_ability_ok
  end

#tour.rb
 #array of tours starting in next 30 days from today
  def self.upcoming_tours_next_30_days
    all_tours = self.all
    today_date = Date.today
    date_in_30 = Date.today + 30
    tours_next_30_days = []
    for tour in all_tours
      if Date.parse(tour.start_date) >= today_date &&  Date.parse(tour.start_date) <= date_in_30
        tours_next_30_days << tour
      end
    end
    return tours_next_30_days
  end

  def current_bookings
    sql = 'SELECT COUNT(*) FROM bookings WHERE tour_id = $1'
    values = [@id]
    result = SqlRunner.run(sql, values)
    return result.getvalue(0,0)
  end

  def percent_filled
    current_bookings = @current_bookings
    percent_filled = (current_bookings / @max_capacity)* 100
    return percent_filled
  end

end
