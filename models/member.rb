require_relative('../db/sql_runner.rb')

class Member
  attr_reader :id
  attr_accessor :name, :age, :ability, :avalanche_trained

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @age = options['age'].to_i
    @ability = options['ability'].to_i
    @avalanche_trained = options['avalanche_trained']
  end

  def tours()
    sql = 'SELECT tours.* FROM tours INNER JOIN bookings ON bookings.tour_id = tours.id WHERE bookings.member_id = $1;'
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map { |tour| Tour.new(tour) }
  end

  def save
    sql = 'INSERT INTO members (name, age, ability, avalanche_trained) VALUES ($1, $2, $3, $4) RETURNING id'
    values = [@name, @age, @ability, @avalanche_trained]
    results = SqlRunner.run(sql, values)
    @id = results.first['id'].to_i
  end

  def delete
    sql = 'DELETE FROM members WHERE id = $1'
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def update
    sql = 'UPDATE members SET (name, age, ability, avalanche_trained) = ($1, $2, $3, $4) WHERE id = $5'
    values = [@name, @age, @ability, @avalanche_trained, @id]
    SqlRunner.run(sql, values)
  end

  def self.all
    sql = 'SELECT * FROM members'
    results = SqlRunner.run(sql)
    return results.map { |member| Member.new(member)  }
  end

  def self.find(id)
    sql = "SELECT * FROM members
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run( sql, values )
    return Member.new( results.first )
  end

  def self.delete_all
    sql = 'DELETE FROM members'
    SqlRunner.run(sql)
  end

  def book_tour(tour)
    return unless tour.spaces_remaining > 0
    return unless ability_high_enough?(tour)
    Booking.new('member_id' => @id, 'tour_id' => tour.id).save()
    tour.increase_spaces_booked()
    tour.update()
  end

  def ability_high_enough?(tour)
    return @ability >= tour.difficulty
  end

  def self.count_all_members()
    all_members = self.all
    return all_members.count
  end

#all members who have booked tours
  def self.count_all_active_members()
    sql = 'SELECT * FROM members
          INNER JOIN bookings
          ON members.id = bookings.member_id'
    results = SqlRunner.run(sql)
    results_array = results.map { |member| Member.new(member)  }
    return results_array.count
  end

  def is_member_booked_on_tour?(tour)
    all_tours_booked = tours()
    if all_tours_booked.include?(tour)
      return true
    else
      return false
  end
end
end
