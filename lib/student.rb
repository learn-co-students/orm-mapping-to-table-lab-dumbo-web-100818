class Student
  attr_reader :id, :name, :grade

  def initialize(id = nil, name, grade)
    @id = id
    @name = name
    @grade = grade
  end

  def self.create_table
    DB[:conn].execute(
        "CREATE TABLE students (
          id INTEGER PRIMARY KEY,
          name TEXT,
          grade TEXT
        )"
    )
  end

  def self.drop_table
    DB[:conn].execute("DROP TABLE students")
  end

  def save
    student = Student.new(name, grade)
    DB[:conn].execute("INSERT INTO students (name, grade) VALUES (?, ?)", name, grade)
    id = DB[:conn].execute("SELECT last_insert_rowid()")
    @id = id[0][0]
  end

  def self.create(name:, grade:)
    student = Student.new(name, grade)
    student.save
    return student
  end

end
