require('pry-byebug')
class Account

  attr_reader :tags, :merchants, :transactions

  def initialize(params)
    @tags = params['tags']
    @merchants = params['merchants']
    @transactions = params['transactions']
  end

  # def list_merchants
  #   return @merchants.map{|merchant| merchant.name}
  # end

  # def get_merchant( transaction )
  #   @merchants.select { |merchant| transaction.merchant_id == merchant.id }.first
  # end


  # def add_merchant(merchants,new_merchant)
  #    @merchants<<new_merchant
  #   return @merchants.length
  # end

  # def remove_merchant(merchants,merchant)
  #   @merchants.delete(merchant)
  #   return @merchants.length
  # end

  def transactions_range( from, to )
    return @transactions.select { |transaction| transaction.select_date >= from && transaction.select_date <= to }
  end

  def list_tags
    return @tags.map{|tag| tag.name}
  end

  def add_tag(tags,new_tag)
    @tags<<new_tag
    return @tags.length
  end

  def total_number_of_transactions
    return @transactions.length
  end

  def total_transactions_cash
    total = 0
    for transaction in @transactions
      total += transaction.amount.to_f
    end
    return total
  end

  def cash_by_tag(tag_id)
    total = 0
    for transaction in @transactions
      if transaction.tag_id == tag_id
        total += transaction.amount.to_f
      end
    end
    return total
  end

  def spend_by_tag
    result = {
      "food" => 10,
      "drinks" => 100
    }
  end
end
