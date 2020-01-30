require_relative('../db/sql_runner')

class House

  attr_reader :id
  attr_accessor :name

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO houses(name)
    VALUES($1) RETURNING id"
    values = [@name]
    @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM houses"
    houses= SqlRunner.run(sql)
    return houses.map { |house| House.new(house) }
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM houses WHERE id = $1"
    values = [id.to_i]
     house= SqlRunner.run(sql, values)[0]
    return House.new(house)
  end

  def self.delete_all()
    sql = "DELETE FROM houses"
    SqlRunner.run(sql)
  end

end
