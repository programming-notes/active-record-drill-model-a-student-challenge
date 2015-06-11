# Active Record Drill: Model a Student
 
##Summary 

| id | first_name | last_name | birthday | phone | created_at | updated_at |
| --- | --- | --- | --- | --- | --- | --- |
|1 | Hubert | Fried | 1980-04-20 | 419-531-8916 | 2015-03-27 12:00:00 | 2015-03-27 12:00:00 |
|2 | Nanny | Lamar | 1980-03-01 | 312-456-9827 | 2015-03-29 13:30:00 | 2015-03-30 17:45:00 |

*Figure 1*.  Depiction of a students table.

We're going to continue working with Active Record by modeling a student.  We'll build a `Student` class and back up the data for students in the students table of a database (see Figure 1). Working through this challenge will review and reinforce our understanding of Active Record: the relationship between the tables in our database and our Ruby classes, creating tables through Active Record migrations, and writing custom validation methods.  We'll also work with *virtual attributes*.

### Virtual Attributes
```ruby
hubert = Student.find(1)

hubert.first_name
# => "Hubert"

hubert.last_name
# => "Fried"

hubert.full_name
# => "Hubert Fried"
```
*Figure 2*. Exploring some of the attributes of a student object.

Active Record models derive their attributes from the tables that store their data.  In the case of the `Student` class we'll be working with, it's attributes will come from the columns in the students table. However, sometimes it would be beneficial for our objects to have attributes that are not backed up by the database.  In the case of our students, in addition to having a first name and a last name, we might want them to have a full name (see Figure 2).  Or, as we can deduce from Figure 1, our students will have a birthday attribute, but we might also want them to have an age.

Virtual attributes differ from normal attributes in that their values are not persisted in the database. Rather, they are derived from other values in the database.  For example, getting a student's full name requires combining the first and last names.  Calculating the age requires some math using the student's birthday.  To access them, we write *getter methods*, such as `#full_name` or `#age`.

Setting virtual attributes can be less straight forward.  To do so, we write *setter methods*, such as `#full_name=`. What would a full name setter method do?  If we set a student's full name, would it make sense for the student's first and last names to be updated?  What would an `#age=` setter method do?  Would it be possible to derive someone's birthday from their age in years?

We'll explore working with virtual attributes as we work through this challenge. 


##Releases

### Pre-release: Bundle and Create the Datbase
Before we begin working through the releases in this challenge, let's make sure that all the gems we'll be using have been installed and then create the database that we'll be working with.  

1. Run Bundler to ensure that the proper gems have been installed.
2. Use the provided Rake task to create the database.

### Release 0: Create the Model and Migration Files
```text
$ bundle exec rake generate:model NAME=Student
$ bundle exec rake generate:migration NAME=create_students
```
*Figure 3*. Running rake tasks to create model and migration files.

The Rakefile for this challenge contains tasks for creating both model and migration files (see Figure 3 for example usage).  Generated model files will be placed in `app/models/`.  Generated migration files will be placed in `db/migrate/`.

Use the provided rake tasks to create a model file for our `Student` class and a migration for creating the students table.


### Release 1:

In the `db/migrate/20121011144238_create_students.rb` file, you should use ActiveRecord migrations to implement the `change` method. This will allow us to do all of our database schema modifications completely from within code (rather than using SQLite and SQL Designer).  Use the Railsguides [Migration Overview][RailsGuides on Migrations] to get used to the syntax.

Take a minute to look at how the filename is formatted with the numbers then the snake_cased name. Compare this to the class defined within this file. What is the relationship between the filename and the class name? It turns out this (and other naming conventions) is important to ActiveRecord.

#### Test Your Code

Run your migrations using the following command:

```bash
$ rake db:migrate
```

Before submitting this challenge, you must test your code by using the following command:

```bash
$ rspec spec/migrate_create_table_spec.rb
```

All tests should pass.  If the output of the test is confusing, take a look under the hood.  How does the spec file test for expectations?  This is very similar to ruby, see if you can figure it out.

###Release 1 : Your First Object-Relational Model

Create a class called `Student` (in the `app/models/student.rb` file) that meets the following requirements:

#### User Stories

1. Given a `Student` model object, I should be able to easily retrieve her full name via a `name` method.
2. Given a `Student` model object, I should be able to easily know her age (in years) via an `age` method.

Don't overcomplicate this!  From this user story, we can infer that `student.name` would likely be the syntax to access the `name` method. 
What can we infer is needed in the `Student` Class?

#### Test Your Code

Before submitting this challenge, you must test your code by using the following command:

```bash
$ rspec spec/student_spec.rb -e "#name and #age"
```

All tests should pass.

###Release 2 : Validation Magic

Add validations to the `Student` model so that a student cannot be saved unless the following requirements are met:

1. Email addresses must contain at least one `@` character and one `.` character, with at least one character before the `@`, one character between the `@` and first `.`, and at least two characters after the final `.`.
2. Email addresses must be unique across all students.
3. Students must be at least `5` years old.

A great resource for validations is the Railsguides [Validation Overview](http://guides.rubyonrails.org/v3.2.13/active_record_validations_callbacks.html), don't forget to use google too!

#### Test Your Code

Before submitting this challenge, you must test your code by using the following command:

```bash
$ rspec spec/student_spec.rb -e "basic validations"
```

All tests should pass.


###Release 2 : More Advanced Validations

Add another validation to the `Student` model so that a student cannot be saved unless the following requirement is met:

Phone numbers must contain at least 10 digits, _excluding_ non-numeric characters.

#### Test Your Code

Before submitting this challenge, you must test your code by using the following command:

```bash
$ rspec spec/student_spec.rb -e "advanced validations"
```

All tests should pass. 


##Optimize Your Learning 

##Resources

* [Validation Overview](http://guides.rubyonrails.org/v3.2.13/active_record_validations_callbacks.html)
[RailsGuides on Migrations]: http://guides.rubyonrails.org/v3.2.13/migrations.html
