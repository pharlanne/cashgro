require_relative('../models/transaction.rb')
require_relative('../models/merchant.rb')
require_relative('../models/tag.rb')

get '/transactions/new' do
  @tags = Tag.all
  @merchants = Merchant.all
  erb :"transactions/new"
end

post '/transactions' do
  @transaction = Transaction.new(params)
  puts params
  @transaction.save
  redirect to('/transactions')
end

get '/transactions' do
  @transactions = Transaction.all
  erb :"transactions/index"
end

get '/transactions/:id' do
  @transaction = Transaction.find(params[:id])
  @tags = Tag.all
  @merchants = Merchant.all
  erb :"transactions/edit"
end

post '/transactions/:id' do
  puts "params"
  puts params
  @transaction = Transaction.update(params)
  redirect to("transactions/#{params[:id]}")
end

post '/transactions/:id/delete' do 
  Transaction.destroy(params[:id])
  redirect to("/transactions")
end

