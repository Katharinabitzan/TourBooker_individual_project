require_relative('../models/tour.rb')
require_relative('../models/member.rb')
require_relative('../models/booking.rb')
# require('pry-byebug')

Booking.delete_all
Tour.delete_all
Member.delete_all

tour1 = Tour.new({
  'name' => 'Tour 1',
  'max_capacity' => 10,
  'duration' => 3,
  'difficulty' => 1,
  'start_date' => '2019-03-30',
  'location' => 'Hahnenkamm',
  'description' => 'Open to all beginners.',
  'photo' => 'hahnenkamm_photo',
  'tour_leader' => 'Markus'
  })

tour2 = Tour.new({
  'name' => 'Tour 2',
  'max_capacity' => 5,
  'duration' => 1,
  'difficulty' => 2,
  'start_date' => '2019-04-01',
  'location' => 'Aschau',
  'description' => 'For intermediates. Welcoming all those interested in exploring harder slopes.',
  'photo' => 'aschau_photo',
  'tour_leader' => 'Elisabeth'
  })

tour3 = Tour.new({
  'name' => 'Tour 3',
  'max_capacity' => 3,
  'duration' => 7,
  'difficulty' => 4,
  'start_date' => '2019-04-02',
  'location' => 'Pengelstein',
  'description' => 'Long excursion. For advanced only.',
  'photo' => 'pengelstein_photo',
  'tour_leader' => 'Bill'
  })

tour4 = Tour.new({
  'name' => 'Easter Tour',
  'max_capacity' => 6,
  'duration' => 4,
  'difficulty' => 3,
  'start_date' => '2019-04-22',
  'location' => 'Hahnenkamm',
  'description' => 'Hiking and drinking and skiing all in one!',
  'photo' => 'hahnenkamm_photo',
  'tour_leader' => 'Sally'
  })

tour5 = Tour.new({
  'name' => 'Summer Tour',
  'max_capacity' => 10,
  'duration' => 4,
  'difficulty' => 3,
  'start_date' => '2019-12-24',
  'location' => 'Ben Nevis',
  'description' => 'For those who dont have any christmas buddies!',
  'photo' => 'ben_nevis_photo',
  'tour_leader' => 'Bill'
  })

tour1.save
tour2.save
tour3.save
tour4.save
tour5.save

member1 = Member.new({
  'name' => 'Bilbo Baggins',
  'age' => 40,
  'ability' => 1,
  'avalanche_trained' => false
    })

member2 = Member.new({
  'name' => 'Legolas Greenleaf',
  'age' => 20,
  'ability' => 5,
  'avalanche_trained' => true
    })

member3 = Member.new({
  'name' => 'Aragorn',
  'age' => 55,
  'ability' => 5,
  'avalanche_trained' => true
    })

member4 = Member.new({
  'name' => 'Katharina Bitzan',
  'age' => 26,
  'ability' => 4,
  'avalanche_trained' => false
    })

member5 = Member.new({
  'name' => 'Alasdair Carstairs',
  'age' => 29,
  'ability' => 1,
  'avalanche_trained' => false
    })

member6 = Member.new({
  'name' => 'Eric Cross',
  'age' => 25,
  'ability' => 4,
  'avalanche_trained' => false
    })

member1.save
member2.save
member3.save
member4.save
member5.save
member6.save


booking1 = Booking.new({
  'member_id' => member1.id,
  'tour_id' => tour1.id,
    })

booking2 = Booking.new({
  'member_id' => member2.id,
  'tour_id' => tour1.id,
    })

booking3 = Booking.new({
  'member_id' => member1.id,
  'tour_id' => tour2.id,
    })

# booking1.save
# booking2.save
# booking3.save

# binding.pry
nil
