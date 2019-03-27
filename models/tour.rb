require_relative('../db/sql_runner.rb')

class Tour
  attr_reader :id
  attr_accessor :name, :max_capacity, :current_spaces_booked, :difficulty, :start_date, :location, :description, :photo, :tour_leader

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @max_capacity = options['max_capacity'].to_i
    @current_spaces_booked = options['current_spaces_booked'].to_i
    @difficulty = options['difficulty'].to_i
    @start_date = options['start_date']
    @location = options['location']
    @description = options['description']
    @photo = options['photo']
    @tour_leader = options['tour_leader']
  end

  def increase_spaces_booked
    @current_spaces_booked += 1
    return @current_spaces_booked.to_i
  end

  def members
    sql = 'SELECT members.* FROM members INNER JOIN bookings ON bookings.member_id = members.id WHERE bookings.tour_id = $1;'
    values = [@id]
    result = SqlRunner.run(sql, values)
    return result.map { |member| Member.new(member)  }
  end

  def save
    sql = 'INSERT INTO tours (name, max_capacity, current_spaces_booked, difficulty, start_date, location, description, photo, tour_leader) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9) RETURNING id'

    values = [@name, @max_capacity, @current_spaces_booked, @difficulty, @start_date, @location, @description, @photo, @tour_leader]

    results = SqlRunner.run(sql, values)
    @id = results.first['id'].to_i
  end

  def delete
    sql = 'DELETE FROM tours WHERE id = $1'
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def update
    sql = 'UPDATE tours SET (name, max_capacity, current_spaces_booked, difficulty, start_date, location, description, photo, tour_leader) = ($1, $2, $3, $4, $5, $6, $7, $8, $9) WHERE id = $10'
    values = [@name, @max_capacity, @current_spaces_booked, @difficulty, @start_date, @location, @description, @photo, @tour_leader, @id]
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
  def self.order_by_date
    sql = "SELECT * FROM tours
    ORDER BY start_date ASC;"
    results = SqlRunner.run( sql )
    return results.map { |tour| Tour.new(tour) }
  end

  def members_with_high_enough_ability
    sql = 'SELECT members.* FROM members, tours
          WHERE members.ability >= tours.difficulty
          AND tours.id = $1'
    values = [@id]
    result = SqlRunner.run(sql, values)
    return result.map { |member| Member.new(member)  }
  end

###Not working (unexpected tIDENTIFIER)
  def upcoming_tours_this_month
    sql = 'SELECT * FROM tours
          WHERE tours.start_date >= date_trunc('month', CURRENT_DATE)
          AND tours.start_date < date_trunc('month', CURRENT_DATE) + interval "1 month";'
    results = SqlRunner.run(sql)
    return results.map { |tour| Tour.new(tour)  }
  end

end
