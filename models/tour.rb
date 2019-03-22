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
end
