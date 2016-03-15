require( 'minitest/autorun' )
require_relative('../models/merchant')

class TestMerchant < MiniTest::Test

  def setup
    params = {
      'name'=> 'Tesco',
    }

    @merchants = Merchant.new(params)
  end

  



end