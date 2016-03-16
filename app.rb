require('sinatra')
require('sinatra/contrib/all') if development?
require('pry-byebug')
require_relative('controllers/tags_controller')
require_relative('controllers/merchants_controller')
require_relative('controllers/transactions_controller')
require_relative('controllers/accounts_controller')
require_relative('controllers/savings_controller')

get'/' do
  erb :"home"
end