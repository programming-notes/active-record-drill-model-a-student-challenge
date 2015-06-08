# Db Drill AR Student Schema 
 
##Summary 
We're going to continue working with Active Record. Part of this challenge will review the relationship between the tables in our database and our Ruby classes.  We'll also work with *virtual attributes*.


| id | first_name | last_name | birthday | phone | created_at | updated_at |
| --- | --- | --- | --- | --- | --- | --- |
|1 | Hubert | Fried | 1980-04-20 | 419-531-8916 | 2015-03-27 12:00:00 | 2015-03-27 12:00:00 |
|2 | Amie | Granger | 1980-03-01 | 312-456-9827 | 2015-03-29 13:30:00 | 2015-03-30 17:45:00 |

*Figure 1*.  Depiction of a students table.

We'll be working with student data in this challenge.  We'll start by setting up a database with a `students` table (see Figure 1) and a `Student` model.  Once the table is set up, we'll seed it with some data.  Then, we'll modify the table while preserving its data.  And finally, we'll add some functionality to the `Student` model.

### Virtual Attributes
```ruby
hubert = Student.find(1)
hubert.first_name
# => "Hubert"
hubert.last_name
# => "Fried"
```
*Figure 2. Exploring some of the attributes of a student object.

Active Record models derive their attributes from the tables that store their data.  In the case of the `Student` class we'll be working with, it's attributes will come from the columns in the students table (see Figure 2). However, sometimes it would be beneficial for our objects to have attributes that are not backed up by the database.  In the case of our students, we might want them to have a full name in addition to having a first name and a last name.  Or, as we can see in Figure 1, our students will have a birthday attribute, but we might also want them to have an age.

There's nothing really special about *virtual attributes*.  They are simply behaviors that our objects have.  To access them, we write *getter methods*, such as `#full_name` or `#age`.  They differ from normal attributes in that their values are not persisted in the database. Rather, they are derived from values in the database.  For example, getting a student's full name requires combining the first and last names.  Calculating the age requires some math using the student's birthday.  Setting virtual attributes is less straight forward, but it can often be done.  And to do so, we write *setter methods*, such as `#full_name=`. 

We'll explore working with virtual attributes as we work through this challenge. 



#### Before You Begin

* Open the `ar-student-schema` directory in the source directory. 
2. Install the necessary dependencies using Bundler: `$ bundle`
3. Create your database: `$ rake db:create`  **(This is important!)**


##Releases

###Release 0 : Migrations for Schema Creation

In the `db/migrate/20121011144238_create_students.rb` file, you should use ActiveRecord migrations to implement the `change` method. This will allow us to do all of our database schema modifications completely from within code (rather than using SQLite and SQL Designer).  Use the Railsguides [Migration Overview](http://guides.rubyonrails.org/v3.2.13/migrations.html) to get used to the syntax.

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
