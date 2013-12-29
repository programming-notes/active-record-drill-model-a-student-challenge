# Db Drill Ar Student Schema 
 
##Learning Competencies 

##Summary 

 #### A Note About This Unit

Please be aware that none of the challenges in this unit depend-on or use all of Rails. They *do*, however, use ActiveRecord, which is a part of Rails. If you are familiar with Rails, please don't expect all of the typical Rails `rake` commands to work exactly as they do in Rails. This unit covers just a subset.

#### Overview

You probably remember the [Student Schema] (http://socrates.devbootcamp.com/challenges/51) challenge from before. In case you don't, let's refresh your memory:

<pre>
+------------+
| students   |
+------------+
| id         |
| first_name |
| last_name  |
| gender     |
| birthday   |
| email      |
| phone      |
+------------+
</pre>

This challenge will get you familiar with the basics of using the ActiveRecord [ORM] (http://en.wikipedia.org/wiki/Object-relational_mapping) feature that is built-in to Rails, including using [migrations] (http://guides.rubyonrails.org/v3.2.13/migrations.html) and [validations] (http://guides.rubyonrails.org/v3.2.13/active_record_validations_callbacks.html).

If you're unfamiliar with the [object-relational mapping (ORM)] (http://en.wikipedia.org/wiki/Object-relational_mapping), or if you've never looked at ActiveRecord before, it's probably worth reading the [Ruby on Rails ActiveRecord Guide](http://guides.rubyonrails.org/active_record_basics.html).

Using `git`, commit early and commit *often*. You should be able to point a reviewer at a `git` SHA to show them any completed objective.  To submit your challenge, you will copy the URI of your git repository into a gist - with a few comments about what the project does, and submit the URI of the gist. (Please submit the URI of the gist, not the URI of your git repository so we can comment on the gist).

#### Before You Begin

1. Fork the [repository](https://github.com/dbc-challenges/ar-student-schema), then clone it onto your workstation using the command line (eg. `git clone https://github.com/yourgitloginhere/ar-student-schema.git`).  DO NOT CLONE THE DBC-CHALLENGES version, clone your forked version.
2. Install the necessary dependencies using Bundler: `$ bundle`
3. Create your database: `$ rake db:create`  **(This is important!)**

## Objectives

### Migrations for Schema Creation

In the `db/migrate/20121011144238_create_students.rb` file, you should use ActiveRecord migrations to implement the `change` method. This will allow us to do all of our database schema modifications completely from within code (rather than using SQLite and SQL Designer).  Use the Railsguides [Migration Overview](http://guides.rubyonrails.org/v3.2.13/migrations.html) to get used to the syntax.

#### Test Your Code

Before you test your code, you'll need to run your migrations using the following command:

```bash
$ rake db:migrate
```

Before submitting this challenge, you must test your code by using the following command:

```bash
$ rspec spec/migrate_create_table_spec.rb
```

All tests should pass.  If the output of the test is confusing, take a look under the hood.  How does the spec file test for expectations?  This is very similar to ruby, see if you can figure it out.

### Your First Object-Relational Model

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

### Validation Magic

Add validations to the `Student` model so that a student cannot be saved unless the following requirements are met:

1. Email addresses must contain at least one `@` character and one `.` character, with at least one character before the `@`, one character between the `@` and first `.`, and at least two characters after the final `.`.
2. Email addresses must be unique across all students.
3. Students must be at least `5` years old.

A great resource for validations is the Railsguides [Validation Overview](http://guides.rubyonrails.org/v3.2.13/active_record_validations_callbacks.html), don't forget to use google too!

#### Test Your Code

Before submitting this challenge, you must test your code by using the following command:

```bash
$ rspec spec/student_spec.rb -e "validations"
```

All tests should pass.


### More Advanced Validations

Add another validation to the `Student` model so that a student cannot be saved unless the following requirement is met:

Phone numbers must contain at least 10 digits, _excluding_ non-numeric characters.

#### Test Your Code

Before submitting this challenge, you must test your code by using the following command:

```bash
$ rspec spec/student_spec.rb -e "advanced validations"
```

All tests should pass. 

##Releases
###Release 0 

##Optimize Your Learning 

##Resources