require_relative('../models/merchant.rb')


get '/merchants/new' do
  erb :"merchants/new"
end

post '/merchants' do
  @merchant = Merchant.new(params)
  @merchant.save
  redirect to('/merchants')
end

get '/merchants' do
  @merchants = Merchant.all
  erb :"merchants/index"
end

get '/merchants/:id' do
  @merchant = Merchant.find(params[:id])
  erb :"merchants/edit"
end

post '/merchants/:id' do
  puts "params"
  puts params
  @merchant = Merchant.update(params)
  redirect to("merchants/#{params[:id]}")
end

post '/merchants/:id/delete' do 
  Merchant.destroy(params[:id])
  redirect to("/merchants")
end

