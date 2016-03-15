require('pg')
require_relative( '../db/sql_runner' )
   
class Transaction

  attr_reader :tag_id, :merchant_id, :amount, :select_date, :tag_spend_limit, :id

  def initialize(params)
    @id = params['id']
    @select_date = params['select_date']
    @merchant_id = params['merchant_id']
    @tag_id = params['tag_id'].to_i
    @amount = params['amount']
    @tag_spend_limit = params['tag_spend_limit']
  end

  def self.all
    sql = "SELECT * FROM transactions"
    transactions = SqlRunner.execute(sql)
    return transactions.map {|transaction| Transaction.new(transaction)}
  end

  def save
    sql = """
    INSERT INTO transactions (
    select_date, 
    merchant_id, 
    tag_id, 
    amount, 
    tag_spend_limit) 
    VALUES (
    '#{@select_date}', 
    #{@merchant_id}, 
    #{@tag_id}, 
    #{@amount}, 
    #{@tag_spend_limit})
    """

    SqlRunner.execute( sql )
  end

  def self.last_entry
    sql = "SELECT * FROM transactions ORDER BY id DESC limit 1;"
    return SqlRunner.execute( sql ).first()
  end

  def self.find(id)
    sql = "SELECT * FROM transactions WHERE ID=#{id}"
    transaction = SqlRunner.execute(sql)
    result = Transaction.new(transaction.first)
    return result
  end

  def total_amount
    total = 0
    for transaction in @transactions
      total += transaction.amount.to_i
    end
    return total

  end
  #move meeeeee
  def merchant
    sql = "SELECT * FROM merchants WHERE id=#{@merchant_id}"
    merchant = SqlRunner.execute(sql)
    result = Merchant.new(merchant.first)
    return result
    # return Merchant.find(@merchant_id)
  end

  def tag
    sql = "SELECT * FROM tags WHERE id=#{@tag_id}"
    tag = SqlRunner.execute(sql)
    result = Tag.new(tag.first)
    return result
  end
  
  def self.update(params)
    sql = """
    UPDATE transactions 
    SET 
      select_date='#{params['select_date']}',
      merchant_id='#{params['merchant_id']}',
      tag_id='#{params['tag_id']}',
      amount='#{params['amount']}',
      tag_spend_limit='#{params['tag_spend_limit']}'
    """
    SqlRunner.execute(sql)
  end

  def self.destroy(id)
    sql = "DELETE FROM transactions WHERE id=#{id}"
    SqlRunner.execute(sql)
  end

end