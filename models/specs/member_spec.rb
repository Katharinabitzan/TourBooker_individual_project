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

end
