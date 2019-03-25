require( 'sinatra' )
require( 'sinatra/contrib/all' )
# require( 'pry-byebug' )
require_relative( '../models/member.rb' )
also_reload( '../models/*' )

#INDEX
get '/members' do
  @members = Member.all()
  erb(:"members/members_index")
end

#SHOW
get '/members/:id' do
   @member = Student.find(params['id'])
   erb(:show)
end

# binding.pry
# nil
