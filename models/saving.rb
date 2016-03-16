class Saving

  attr_reader :tags, :merchants, :transactions

  def initialize(params)
    @tags = params['tags']
    @merchants = params['merchants']
    @transactions = params['transactions']
  end

  
end