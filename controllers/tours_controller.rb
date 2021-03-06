require( 'sinatra' )
require( 'sinatra/contrib/all' ) if development?
# require( 'pry-byebug' )
require_relative( '../models/tour.rb' )
require_relative( '../models/member.rb' )
require_relative( '../models/booking.rb' )
# also_reload( '../models/*' )

#INDEX
get '/tours' do
  @tours = Tour.all()
  @ordered_tours = Tour.order_by_date
  erb(:"tours/tours_index")
end

#NEW
get '/tours/new' do
  @tours = Tour.all
  erb(:"tours/tours_new")
end

#CREATE
post '/tours' do
  Tour.new(params).save
  redirect to '/tours'
end

#SHOW
get '/tours/:id' do
   @tour = Tour.find(params['id'].to_i)
   @members = @tour.members
   erb(:"tours/tours_show")
end

#EDIT
get '/tours/:id/edit' do
  @tour = Tour.find(params['id'])
  erb(:"tours/tours_edit")
end

#UPDATE
post '/tours/:id' do
  tour = Tour.new(params)
  tour.update
  redirect to "/tours/#{params['id']}"
end

#DELETE
post '/tours/:id/delete' do
  tour = Tour.find(params['id'])
  tour.delete
  redirect to '/tours'
end

#EDIT ADD MEMBER TO TOUR - FROM TOUR PAGE = BOOKING NEW
get '/tours/:id/booking' do
  @tour = Tour.find(params['id'])
  @potential_members = @tour.members_with_high_enough_ability
  erb(:"/tours/tours_add_member")
end

#CREATE ADD MEMBER TO TOUR
post '/tours/:id/booking' do
  @tour = Tour.find(params['id'])
  number_bookings = Booking.all.count.to_i
  Booking.new(params).save
  updated_bookings = Booking.all.count.to_i

  if updated_bookings == number_bookings
    @reaction = "Booking is not possible. The maximum capacity has already been reached."
  else
    @reaction = "Booking successful."
  end
  erb(:"/bookings/bookings_reaction")
end


nil
