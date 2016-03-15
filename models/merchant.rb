require('pg')
require_relative( '../db/sql_runner' )

class Merchant

  attr_reader :id, :name

    def initialize(params)
      @id = params['id']
      @name = params['name']
    end

    def self.all()
     sql = "SELECT * FROM merchants"
     merchants = SqlRunner.execute( sql )
     return merchants.map { |merchant| Merchant.new( merchant ) }
    end

   def save()
      sql = "INSERT INTO merchants (
      name) 
      VALUES (
      '#{ @name}' )"
      SqlRunner.execute( sql )
   end

  def last_entry
    sql = "SELECT * FROM merchants ORDER BY id DESC limit 1;"
    return SqlRunner.execute( sql ).first()
  end

  def self.find(id)
    sql = "SELECT * FROM merchants WHERE ID=#{id}"
    merchant = SqlRunner.execute(sql)
    result = Merchant.new(merchant.first)
    return result
  end

  

  def self.update(params)

    sql = "UPDATE merchants SET name='#{params['name']}' WHERE ID=#{params['id']}"
    SqlRunner.execute(sql)
  end

  def self.destroy(id) 
    sql = "DELETE FROM merchants WHERE id=#{id}"
    SqlRunner.execute( sql )
  end



end