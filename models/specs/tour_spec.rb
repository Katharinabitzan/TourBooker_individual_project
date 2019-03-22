require('minitest/autorun')
require('minitest/rg')
require_relative('../member.rb')
require_relative('../booking.rb')
require_relative('../tour.rb')

class TestTour < Minitest::Test

  def setup
    @tour1 = Tour.new({
      'max_capacity' => 5,
      'current_spaces_booked' => 0,
      'difficulty' => 1,
      'start_date' => '2019-03-25',
      'location' => 'Hahnenkamm',
      'description' => 'Ride on slopes.',
      'photo' => 'hahnenkamm_photo',
      'tour_leader' => 'Markus'
      })

    @tour2 = Tour.new({
      'max_capacity' => 5,
      'current_spaces_booked' => 0,
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

  def test_tour_has_current_spaces_booked
    assert_equal(0, @tour1.current_spaces_booked)
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

end
