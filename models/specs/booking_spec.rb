require('minitest/autorun')
require('minitest/rg')
require_relative('../member.rb')
require_relative('../booking.rb')
require_relative('../tour.rb')

class TestBooking < Minitest::Test

  def setup
    @member1 = Member.new({
      'name' => 'Bilbo Baggins',
      'age' => 40,
      'ability' => 4,
      'avalanche_trained' => false
        })
    @member2 = Member.new({
      'name' => 'Marvin More',
      'age' => 20,
      'ability' => 5,
      'avalanche_trained' => true
        })
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
    @booking1 = Booking.new({
      'member_id' => @member1.id,
      'tour_id' => @tour1.id,
        })
    @booking2 = Booking.new({
      'member_id' => @member2.id,
      'tour_id' => @tour1.id,
        })


  end

  def test_can_create_booking_class()
    assert_equal(Booking, @booking1.class)
  end

end
