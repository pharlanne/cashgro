require_relative("../models/saving.rb")
require_relative('../models/transaction.rb')
require_relative('../models/merchant.rb')
require_relative('../models/tag.rb')
require_relative('../models/account.rb')

get '/savings' do
  erb :"savings/index"
end