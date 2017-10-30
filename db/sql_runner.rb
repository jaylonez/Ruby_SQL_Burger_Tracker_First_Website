require 'pg'

class SqlRunner

  def self.run(sql, values)
    begin
      db = PG.connect($db)
      db.prepare("query", sql)
      result = db.exec_prepared("query", values)
    ensure
      db.close()
    end
    return result
  end

end
