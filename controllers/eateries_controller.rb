require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('../models/eatery.rb')

get '/eateries' do
  @eateries = Eatery.all
  erb( :"eateries/index" )
end

get '/eateries/new' do
  erb( :"eateries/new" )
end

post '/eateries' do
  Eatery.new(params).save
  redirect to '/eateries'
end

get '/eateries/:id' do
  @eatery = Eatery.show(params[:id])
  erb( :"eateries/show" )
end

get '/eateries/:id/new' do
  @eatery_id = params[:id]
  erb( :"burgers/new" )
end

post '/eateries/:id' do
  Burger.new(params).save
  redirect to '/eateries/'
end
