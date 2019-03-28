require_relative('../db/sql_runner.rb')
require( 'date' )

class Booking
  attr_reader :id
  attr_accessor :member_id, :tour_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @member_id = options['member_id'].to_i
    @tour_id = options['tour_id'].to_i
  end

  def member()
    sql = "SELECT * FROM members
    WHERE id = $1"
    values = [@member_id]
    results = SqlRunner.run( sql, values )
    return Member.new( results.first )
  end

  def tour()
    sql = "SELECT * FROM tours
    WHERE id = $1"
    values = [@tour_id]
    results = SqlRunner.run( sql, values )
    return Tour.new( results.first )
  end

  def save
    member = member()
    tour = tour()
    result = is_booking_possible?(member,tour)
      if result == true
        sql = 'INSERT INTO bookings (member_id, tour_id) VALUES ($1, $2) RETURNING id'
        values = [@member_id, @tour_id]
        results = SqlRunner.run(sql, values)
        @id = results.first['id'].to_i
      else
        return "Not possible"
      end
  end

  def is_booking_possible?(member, tour)
    return false unless tour.current_bookings.to_i < tour.max_capacity
    return false unless tour.difficulty <= member.ability
    return true
  end

  def delete
    sql = 'DELETE FROM bookings WHERE id = $1'
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def update
    sql = 'UPDATE bookings SET (member_id, tour_id) = ($1, $2) WHERE id = $3'
    values = [@member_id, @tour_id, @id]
    SqlRunner.run(sql, values)
  end

  def self.all
    sql = 'SELECT * FROM bookings'
    results = SqlRunner.run(sql)
    return results.map { |booking| Booking.new(booking)  }
  end

  def self.find(id)
    sql = "SELECT * FROM bookings
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run( sql, values )
    return Booking.new( results.first )
  end

  def self.delete_all
    sql = 'DELETE FROM bookings'
    SqlRunner.run(sql)
  end

end
