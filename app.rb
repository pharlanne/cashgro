require('sinatra')
require('sinatra/contrib/all') if development?
require_relative('controllers/tags_controller')
require_relative('controllers/merchants_controller')
require_relative('controllers/transactions_controller')
require_relative('controllers/accounts_controller')

get'/' do
  erb :"home"
end