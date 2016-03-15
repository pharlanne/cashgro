require('pg')
require_relative( '../db/sql_runner' )


class Tag

      attr_reader :id, :name

    def initialize(params)
        @id= params['id'].to_i
        @name = params['name']
    end

    def self.all()
         sql = "SELECT * FROM tags"
         tags = SqlRunner.execute( sql )
         return tags.map { |tag| Tag.new( tag) }
    end

    def save()
        sql = "INSERT INTO tags (
        name) 
        VALUES (
        '#{ @name }' )"
        SqlRunner.execute( sql )
    end

    def last_entry
        sql = "SELECT * FROM tags ORDER BY id DESC limit 1;"
        return SqlRunner.execute( sql ).first()
    end

    def self.find(id)
        sql= "SELECT * FROM tags WHERE ID=#{id}"
        tag= SqlRunner.execute(sql)
        result = Tag.new( tag.first )  
        return result
    end

    

    def self.update(params)

        sql = "UPDATE tags SET name='#{params['name']}' WHERE ID=#{params['id']}"
        SqlRunner.execute(sql)
    end


    def self.destroy(id)
       sql = "DELETE FROM tags WHERE id=#{id}"
       SqlRunner.execute( sql )
    end

end