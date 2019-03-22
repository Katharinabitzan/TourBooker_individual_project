require_relative('../models/tour.rb')
require_relative('../models/member.rb')
require_relative('../models/booking.rb')
require('pry-byebug')

Tour.delete_all
Member.delete_all


tour1 = Tour.new({
  'max_capacity' => 5,
  'current_spaces_booked' => 0,
  'difficulty' => 1,
  'start_date' => '2019-03-25',
  'location' => 'Hahnenkamm',
  'description' => 'Ride on slopes.',
  'photo' => 'hahnenkamm_photo',
  'tour_leader' => 'Markus'
  })

tour2 = Tour.new({
  'max_capacity' => 5,
  'current_spaces_booked' => 0,
  'difficulty' => 3,
  'start_date' => '2019-04-27',
  'location' => 'Aschau',
  'description' => 'Ride in backcountry.',
  'photo' => 'aschau_photo',
  'tour_leader' => 'Elisabeth'
  })

tour3 = Tour.new({
  'max_capacity' => 3,
  'current_spaces_booked' => 0,
  'difficulty' => 4,
  'start_date' => '2019-03-31',
  'location' => 'Pengelstein',
  'description' => 'Ride in between trees.',
  'photo' => 'pengelstein_photo',
  'tour_leader' => 'Bill'
  })

tour1.save
tour2.save
tour3.save

member1 = Member.new({
  'name' => 'Bilbo Baggins',
  'age' => 40,
  'ability' => 4,
  'avalanche_trained' => false
    })

member2 = Member.new({
  'name' => 'Marvin More',
  'age' => 20,
  'ability' => 5,
  'avalanche_trained' => true
    })

member3 = Member.new({
  'name' => 'Will Smith',
  'age' => 45,
  'ability' => 1,
  'avalanche_trained' => false
    })

member1.save
member2.save
member3.save


# booking1 = Booking.new({
#   'member_id' => member1.id,
#   'tour_id' => tour1.id,
#     })
#
# booking2 = Booking.new({
#   'member_id' => member2.id,
#   'tour_id' => tour1.id,
#     })
#
# booking3 = Booking.new({
#   'member_id' => member1.id,
#   'tour_id' => tour2.id,
#     })

binding.pry
nil
