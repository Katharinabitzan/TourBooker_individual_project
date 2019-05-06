require( 'sinatra' )
require( 'sinatra/contrib/all' ) if development?
# require( 'pry-byebug' )
require_relative( '../models/member.rb' )
require_relative( '../models/tour.rb' )
require_relative( '../models/booking.rb' )
also_reload( '../models/*' )

#INDEX
get '/members' do
  @members = Member.all()
  @members_number = Member.count_all_members
  erb(:"members/members_index")
end

#NEW
get '/members/new' do
  @members = Member.all
  erb(:"members/members_new")
end

#CREATE
post '/members' do
  Member.new(params).save
  redirect to '/members'
end

#SHOW
get '/members/:id' do
   @member = Member.find(params['id'].to_i)
   @tours = @member.tours
   # dated_tours = @tours.map { |tour| tour.start_date  }
   # @member.unavailable_dates
   erb(:"members/members_show")
end

#EDIT
get '/members/:id/edit' do
  @member = Member.find(params['id'])
  erb(:"members/members_edit")
end

#UPDATE
post '/members/:id' do
  member = Member.new(params)
  member.update
  redirect to "/members/#{params['id']}"
end

#DELETE
post '/members/:id/delete' do
  member = Member.find(params['id'])
  member.delete
  redirect to '/members'
end

#INDEX BY ABILITY
# get '/members/ability' do
#   @abilities = [1, 2, 3, 4, 5]
#   chosen_ability = params['ability']
#   @members = Member.all_by_ability(chosen_ability)
#
#   erb(:"members/ability")
# end


# nil
