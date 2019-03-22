require('minitest/autorun')
require('minitest/rg')
require_relative('../member.rb')
require_relative('../booking.rb')
require_relative('../tour.rb')

class TestBooking < Minitest::Test

  def setup
    @booking1 = Booking.new({
      'member_id' => member1.id,
      'tour_id' => tour1.id,
        })

    @booking2 = Booking.new({
      'member_id' => member2.id,
      'tour_id' => tour1.id,
        })
  end

  def test_can_create_booking_class
    assert_equal(Booking, @booking1.class)
  end


end
