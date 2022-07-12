#
#
# ORM REVIEW AND INTRO TO ACTIVERECORD
#
#

# What is an ORM?
- Object relational mapping is the system that translates between SQL rewcords and Ruby (or other languages)
- The ActiveRecord ORM translates rows from your SQL tables into Ruby objects on "fetch"
- It translates your ruby objects back into rows on "save"
- ORM empowers your ruby classes with convenient methods to perform common SQL operations
- The properties and relationships of the objects in an application can be easily stored and retrieved without writing SQl statements directly


# Model Classes and ActiveRecord::Base
- For each table, we define a ruby model class; an instance of the model represents a row of the table
- All model classes extend 'ApplicationRecord' which in turn extends 'ActiveRecord::Base'
- 'ApplicationRecord'
	- Extends 'ActiveRecord::Base'
	- An intermediary class that is used to extend into model classes
	- Used so we never have to include modules directly on 'ActiveRecord::Base'
- 'ActiveRecord::Base' 
	- Methods in allow us to fetch and save ruby objects to/from the tables
	- Able to infer from the class name ('Physician') that the associated table is 'physicians'
	- Model classes are always singular, like how tables are always plural
- Methods 
	- ::find(x)  | lookup an Physician with the primary key X
	- ::all      | return an array of all Physician objects, one for each row in the physicians table
	- ::where    | lookup objects by criteria other than primary key
			example: Physician.where('home_city = ?', 'La Jolla')  # Using SQL Fragments
			example: Physician.where(years_experience: (3..9))  # Using Rails features
	- .get       | by extending ActiveRecord::Base, model classes automatically inherit getter methods for each column
	- .set       | also setter methods are automatically defined
	- .save      | in order to save the object to the database, we use this method 
	- .create!   | this can also be used to create a record and immediately save it to the database
	- .destroy   | destroys a record from the database 


# Rails Console
You open up a console by running 'rails c'. It will automatically load all your rails objects and open a connection to the database.
'reload!' is a command that reloads all the model classes
'rails dbconsole' lets you access an SQL console

