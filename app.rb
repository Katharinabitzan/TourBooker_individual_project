require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/members_controller')
require_relative('controllers/tours_controller')
require_relative('controllers/bookings_controller')

get '/' do
  @upcoming_tours_this_month = Tour.upcoming_tours_this_month
  erb( :index )
end
