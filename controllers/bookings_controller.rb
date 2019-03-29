require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/member.rb' )
require_relative( '../models/tour.rb' )
require_relative( '../models/booking.rb' )
also_reload( '../models/*' )

#INDEX
get '/bookings' do
  @bookings = Booking.all()
  erb(:"bookings/bookings_index")
end

#NEW
get '/bookings/new' do
  @bookings = Booking.all
  @members = Member.all
  @tours = Tour.all
  erb(:"bookings/bookings_new")
end

#CREATE
post '/bookings' do
  result = Booking.new(params).save
  if result =! nil
    @reaction = "Booking successful"
  else
    @reaction = "Booking not possible"
  end
  erb(:"/bookings/bookings_reaction")
end

#SHOW
get '/bookings/:id' do
   @booking = Booking.find(params['id'].to_i)
   erb(:"bookings/bookings_show")
end

#EDIT
get '/bookings/:id/edit' do
  @booking = Booking.find(params['id'])
  erb(:"bookings/bookings_edit")
end

#UPDATE
post '/bookings/:id' do
  booking = Booking.new(params)
  booking.update
  redirect to "/bookings/#{params['id']}"
end

#DELETE
post '/bookings/:id/delete' do
  booking = Booking.find(params['id'])
  booking.delete
  redirect to '/bookings'
end

# binding.pry
# nil
