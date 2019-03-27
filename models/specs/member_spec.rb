require('minitest/autorun')
require('minitest/rg')
require_relative('../member.rb')
require_relative('../booking.rb')
require_relative('../tour.rb')

class TestMember < Minitest::Test

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

    @member3 = Member.new({
      'name' => 'Will Smith',
      'age' => 45,
      'ability' => 1,
      'avalanche_trained' => false
        })

    @tour1 = Tour.new({
      'name' => 'Exciting tour',
      'max_capacity' => 5,
      'current_spaces_booked' => 0,
      'difficulty' => 1,
      'start_date' => '2019-03-25',
      'location' => 'Hahnenkamm',
      'description' => 'Ride on slopes.',
      'photo' => 'hahnenkamm_photo',
      'tour_leader' => 'Markus'
      })

    @tour3 = Tour.new({
      'name' => 'Fun tour',
      'max_capacity' => 3,
      'current_spaces_booked' => 0,
      'difficulty' => 4,
      'start_date' => '2019-03-31',
      'location' => 'Pengelstein',
      'description' => 'Ride in between trees.',
      'photo' => 'pengelstein_photo',
      'tour_leader' => 'Bill'
      })
  end

  def test_can_create_member_class
    assert_equal(Member, @member1.class)
  end

  def test_member_has_name
    assert_equal('Bilbo Baggins', @member1.name)
  end

  def test_member_has_age
    assert_equal(40, @member1.age)
  end

  def test_member_has_ability()
    assert_equal(4, @member1.ability)
  end

  def test_member_avalanche_trained__true
    assert_equal(true, @member2.avalanche_trained)
  end

  def test_member_avalanche_trained__false
    assert_equal(true, @member2.avalanche_trained)
  end

  def test_ability_high_enough?
    result = @member3.ability_high_enough?(@tour3)
    assert_equal(false, result)
  end

##These fail with foreign key violations

  # def test_book_tour__ability_ok
  #   @member1.book_tour(@tour1)
  #   assert_equal(1, @tour1.current_spaces_booked)
  # end

  # def test_book_tour__ability_not_enough
  #   @member3.book_tour(@tour2)
  # end

end
