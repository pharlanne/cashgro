require_relative('../models/transaction.rb')
require_relative('../models/merchant.rb')
require_relative('../models/tag.rb')
require_relative('../models/account.rb')

require( 'pry-byebug' )


get "/accounts" do
  options = { 
    'tags' => Tag.all(),
    'merchants' => Merchant.all(),
    'transactions' => Transaction.all()
  }

  @account = Account.new(options)
  erb :"accounts/index"
end