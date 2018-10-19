class Student
  attr_reader :name, :grade

  def initialize(name, grade)
    @name = name
    @grade = grade
  end

  def self.create_table
    DB[:conn].execute(<<-SQL
        CREATE TABLE students (
          id INTEGER PRIMARY KEY,
          name TEXT,
          grade TEXT
        )
      SQL
    )
  end

  def self.drop_table
    
  end

end
