class TeachersImporter

  def create_teachers
    puts "Adding teachers to DB..."
    Teacher.create(name: 'Mr. Smith', email: 'smith@matrix.com', address: '10 Matrix Street', phone: '111-1111')
    Teacher.create(name: 'Mrs. Smith', email: 'mrssmith@matrix.com', address: '10 Matrix Street', phone: '111-1111')
    Teacher.create(name: 'Bob', email: 'bob@email.com', address: '10 Pine Street', phone: '111-1111')
    Teacher.create(name: 'Jane', email: 'jane@email.com', address: '10 Ash Street', phone: '123-4567')
    Teacher.create(name: 'Mike', email: 'mike@gmail.com', address: '10 Oak Street', phone: '121-1131')
    Teacher.create(name: 'Donald', email: 'donald@gmail.com', address: '10 Maple Street', phone: '221-1111')
    Teacher.create(name: 'Ruth', email: 'ruth@email.com', address: '10 Fir Street', phone: '201-1541')
    Teacher.create(name: 'Lisa', email: 'lisa@gmail.com', address: '10 Walnut Street', phone: '551-1411')
    Teacher.create(name: 'Robert', email: 'rob@gmail.com', address: '10 Fig Street', phone: '881-1111')
    puts "Done adding teachers to DB!"
  end
end