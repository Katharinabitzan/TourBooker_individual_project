require('minitest/autorun')
require('minitest/rg')
require( 'pry-byebug' )
require_relative('../member.rb')
require_relative('../booking.rb')
require_relative('../tour.rb')

class TestTour < Minitest::Test

  def setup
    @tour1 = Tour.new({
      'max_capacity' => 5,
      'duration' => 3,
      'difficulty' => 1,
      'start_date' => '2019-03-25',
      'location' => 'Hahnenkamm',
      'description' => 'Ride on slopes.',
      'photo' => 'hahnenkamm_photo',
      'tour_leader' => 'Markus'
      })

    @tour2 = Tour.new({
      'max_capacity' => 5,
      'duration' => 5,
      'difficulty' => 3,
      'start_date' => '2019-04-27',
      'location' => 'Aschau',
      'description' => 'Ride in backcountry.',
      'photo' => 'aschau_photo',
      'tour_leader' => 'Elisabeth'
      })
  end


  def test_can_create_tour_class
    assert_equal(Tour, @tour1.class)
  end

  def test_tour_has_max_capacity
    assert_equal(5, @tour1.max_capacity)
  end

  def test_tour_has_duration
    assert_equal(3, @tour1.duration)
  end

  def test_tour_has_difficulty
    assert_equal(1, @tour1.difficulty)
  end

  def test_tour_has_start_date
    assert_equal("2019-03-25", @tour1.start_date)
  end

  def test_tour_has_location
    assert_equal('Hahnenkamm', @tour1.location)
  end

  def test_tour_has_description
    assert_equal('Ride on slopes.', @tour1.description)
  end

  def test_tour_has_photo
    assert_equal('hahnenkamm_photo', @tour1.photo)
  end

  def test_tour_has_tour_leader
    assert_equal('Markus', @tour1.tour_leader)
  end

  def test_spaces_remaining()
    result = @tour1.spaces_remaining
    assert_equal(5, result)
  end

  def

  # def test_percent_filled
  #   current_bookings = 3
  #   decimal = current_bookings / @max_capacity
  #   percent_filled = decimal * 100
  # end

  # def test_members_bookable_on_tour?
  #   result = @tour1.members_bookable_on_tour?
  #   assert_equal(0, result)
  # end

end
