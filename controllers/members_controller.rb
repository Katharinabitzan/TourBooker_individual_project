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

# binding.pry
# nil
