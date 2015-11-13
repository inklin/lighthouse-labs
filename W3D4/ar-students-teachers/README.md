Week 3 Day 4 - Assignment
===========================

# ActiveRecord Students & Teachers

## Introduction

You probably remember how to associate tables in a database using foreign keys. This assignment will build on that knowledge and extend it into the realm of the ActiveRecord ORM. We'll also use database migrations to modify our database over time.

### Topics

* SQLite database
* Database migrations
* One-to-many associations
* Many-to-many associations
* Unit testing models with RSpec
* Rake commands

### Getting Started

1. Fork this repository.
2. Clone your fork of this repository into your working directory.
3. Install the necessary dependencies using Bundler: `bundle`
4. Create your database: `rake db:create`

**Note:** There are bonuses for several questions. Come back to these after you have completed the entire activity.

## What are Migrations?

Migrations are ActiveRecord's way for allowing us to modify the database structure using ruby code. 

Instead of creating a table manually using a SQL query like this...

```SQL
CREATE TABLE employees (
  id         INT          NOT NULL,
  first_name VARCHAR(255),
  last_name  VARCHAR(255),
  address    VARCHAR(255),
  PRIMARY KEY (id)
);
```

...we can use an ActiveRecord migration class to define the table.

```ruby
class CreateEmployees < ActiveRecord::Migration

  def change
    create_table :employees do |t|
      t.string :first_name
      t.string :last_name
      t.string :address
    end
  end

end
```

**TIP:**  Do not confuse ActiveRecord migrations with ActiveRecord models. ActiveRecord migrations manage the structure of the tables: `add_column :students, :address, :string`. ActiveRecord models manage the data within tables: `Student.find(1)`  or `Student.where(firstname: 'Anne')`.

Read about migrations here (to understand them, don't worry about memorizing the different approaches, etc.):

<http://guides.rubyonrails.org/migrations.html>

## Objectives

### 1. Setup Students table

There is a Student model already. But the database does not yet have the `students` table. In fact you don't even have a development database to work against yet.

We need to create an empty database and then update the schema (structure of the database) to include a `students` table. We will use migrations for this.

#### Step 1 - Create DB

Run this rake command to create the database file: `rake db:create`

How does that work? What does it do? Hint: take a look at the `Rakefile`

#### Step 2 - Create `students` table

Modify the CreateStudents migration in `db/migrate/20140319144238_create_students.rb` and implement the `change` method. To find out what columns we need in the students table, look at the student data in `db/data/students.csv`.

Once you implement it, run `rake db:migrate` to run the migration against the database.

#### Step 3 - Make sure the tests pass

We wrote a test case that checks if you created the students table: `spec/migrate_create_table_spec.rb`. 

To set up the database for the test environment run:

    rake db:create DATABASE=test

    rake db:migrate DATABASE=test

Append `DATABASE=test` to all rake commands when you want to make those rake commands apply to the test database.

Run this `rspec` test case to check your migration worked. Remember to prefix your commands with `bundle exec` which tells Ruby to use the correct gem versions from the `Gemfile`. For example:

    bundle exec rspec spec/migrate_create_table_spec.rb

Take a look at the spec file to see what fields it's expecting. How is it working?

If any of the tests fail, you may need to rollback your migration. Use `rake db:rollback DATABASE=test` to reverse the migration against the test database. Then you can fix the migration file and run it again with `rake db:migrate DATABASE=test`. Run the tests again to see if your new migration fixed the errors.

### 2. Command line

To debug/inspect the database, it would be nice to interactively just use ActiveRecord within something like `pry`.

In this project the `app_config.rb` file does all the following "loading" work:

1. Requires a gems like `active_record`.
2. Requires our model classes.
3. Exposes a method for connecting to the database.

So we can just require that one file when we start pry. Give it a shot from the command line:

    pry -r './app_config.rb'

Now you should be able to interactively inspect the database using AR.

    pry(main)> AppConfig.establish_connection
    pry(main)> Student.first
    pry(main)> Student.count

For now, we don't have any data in the database, so `Student.first` will return `nil` and `Student.count` will return `0`.

**Suggestion:** Use a dedicated tab in your Terminal to keep a pry session open. Note that if you make changes to your database or code, you'll want to restart the pry session.

### 3. Import sample students

Once the students table is built and the `spec/migrate_create_table_spec.rb` test passes, let's import the sample student records from a CSV file (for convenience really):

    rake db:populate

**TIP:** Read the rake command and the CSV importer. Do you understand what is going on? If not, discuss amongst yourselves and ask a TA for clarity.

### 4. Add a Teacher Model

Students need teachers. So let's introduce teachers to the app.

Create a `Teacher` model that extends `ActiveRecord::Base`. This model should be created in its own Ruby file and in the right folder (`app/models`). Then you'll need to require it in `app_config.rb` so that it's available to the other files in the project.

You'll also need to create (`touch`) a new migration file in `db/migrate` to create the teachers table. 

The teachers migration file name must start with a bunch of numbers that represent the exact timestamp of when you created the migration. The students migration file is called `20140319144238_create_students.rb`. This means the migration was created on March 3rd, 2014 at 14:42:38. Precede the migration file you are about to create with a timestamp for the current date and time.

We want to store the following information about a teacher:  `name`, `email`, `address`, and `phone`. 

### 5. Insert sample Teacher data

Without resorting to using SQL or SQLite, write some Ruby code that uses __ActiveRecord commands__ to create some test data. Create 9 teachers, each with unique names and email addresses.

While you're at it, please ensure that no 2 teachers can share the same email address using an ActiveRecord validation. 

The student data is imported using a class we wrote called StudentsImporter in `lib/students_importer.rb`. To create the 9 teachers, create your own TeachersImporter class in `lib/teachers_importer.rb`.

With your new `TeachersImporter`, you'll need to require it in `app_config.rb` and also edit the `Rakefile`'s `db:populate` task to run it.

Write a test to be sure creating a Teacher works and the email validation works.

#### Bonus

Implement a CSV-based mechanism for loading the sample teachers much like how `students.csv` is a convenient way to "seed" the students table with sample data. You can use much of the same code as `StudentsImporter`.

### 6. Create a One-to-Many association between Teachers and Students

At this point you should have students and teachers in the database. 

Let's say that we need each student to have a teacher, and each teacher to have many students. Does your Teacher model need to change? How about your Student model? Do you need a migration?

Make the necessary changes to your code to support this new constraint on the data.

**Tip:** You can read about one-to-many and many-to-many relationships here: <http://guides.rubyonrails.org/association_basics.html>

**Tip:** Once you are done, you should be able to do the following in your pry session:

    pry(main)> first_student = Student.first
    pry(main)> first_student.teacher = Teacher.first
    pry(main)> first_student.save!
    pry(main)> first_student.teacher
    # => returns the student's teacher
    pry(main)> first_teacher = Teacher.first
    pry(main)> first_teacher.students
    # => returns an array that contains first_student

#### Bonus

Write tests to ensure that your association is working correctly. For example, given a student, can you find a teacher? Can you find all of her other students?

### 7. Spec file for students

There is a `student_spec.rb` file in this repo. Implement changes to the `Student` class to make the tests pass.
RSpec Tip: the `be_valid` method expects that calling `.valid?` on the ActiveRecord object will return true.

#### Bonus

Write a `teacher_spec.rb` file to validate your Teacher model's validations. 
