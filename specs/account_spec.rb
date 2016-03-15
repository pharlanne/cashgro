require('minitest/autorun')
require_relative('../models/merchant')
require_relative('../models/tag')
require_relative('../models/transaction')
require_relative('../models/account')

class TestAccount <MiniTest::Test

  def setup
    @tag1 = Tag.new({'name'=> "groceries essentials", 'id'=> 1})
    @tag2 = Tag.new({'name'=> "groceries luxury", 'id'=> 2})
    @tags = [@tag1, @tag2]

    @merchant1 =Merchant.new({'name'=>'Tesco', 'id'=> 1})
    @merchant2 =Merchant.new({'name'=>'M&S', 'id'=> 2})
    @merchants = [@merchant1, @merchant2]

    @transaction1 = Transaction.new({
      'select_date'=> '07-03-2016',
      'merchant_id' => @merchant1.id,
      'tag_id'=> @tag1.id,
      'amount' => 14.50,
      'limit' => 20.00
      })
    @transaction2 = Transaction.new({
      'select_date'=> '08-03-2016',
      'merchant_id' => @merchant2.id,
      'tag_id'=> @tag2.id,
      'amount' => 20.00,
      'limit' => 40.00
      })
    @transactions = [@transaction1, @transaction2]

    @account = Account.new({
      'tags'=>@tags,
      'merchants'=>@merchants,
      'transactions'=>@transactions
      })
  end

  def test_list_tags
    result = @account.list_tags
    expectation = ['groceries essentials', 'groceries luxury']
    assert_equal(expectation,result)
  end

  def test_add_tag
    result = @account.add_tag(@tags, 'food')
    assert_equal(3,result)
  end

  def test_total_number_of_transactions
    result = @account.total_number_of_transactions
    assert_equal(2,result)
  end

  def test_total_transactions_cash
    result = @account.total_transactions_cash
    assert_equal(34.50, result)
  end

  def test_total_cash_by_tag
    result = @account.cash_by_tag(1)
    assert_equal(14.50,result)
  end

end