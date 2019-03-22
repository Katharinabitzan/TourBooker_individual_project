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


end
