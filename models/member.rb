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


end
