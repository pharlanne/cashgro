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

  # def transaction_tag(transaction, tag_id)
  #   return transaction if tag_id == 0
  #   return transaction.select{|transaction| transaction.tag_id}
  # end

  def filter_range_tag(from, to, tag_id)
    result = transactions_range(from,to)
    return result if tag_id.to_i == 0
    print "here:", result.select{|transaction| transaction.tag_id == tag_id.to_i }
    return result.select{|transaction| transaction.tag_id == tag_id.to_i }
  end

  def filter_range_merchant(from, to, merchant_id)
    result = transactions_range(from,to)
    return result if merchant_id.to_i == 0
    # print "here:", result.select{|transaction| transaction.tag_id == tag_id.to_i }
    return result.select{|transaction| transaction.merchant_id == merchant_id.to_i }
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
    result = {}
    @tags.each do |tag|
      result[tag.name] = cash_by_tag(tag.id)
    end
    return result
  end
end
