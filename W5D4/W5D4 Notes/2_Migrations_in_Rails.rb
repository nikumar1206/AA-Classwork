#
#
# MIGRATIONS
#
#
#

A way of tracking the evolution of the stucture of a database schema, that can be tracked along with the code in 
the git repository. This is super useful when recording local transformations to the database before they are deployed 
to production
	- Database migrations are files containing Ruby code that describes a set of changes made to the database. 
	- It could create or drop tables, add or remove columns, and more. 
	- Each set of new changes is written inside a new migration file which is checked into the repository


# Basics
- A migration is a Ruby class that extends ActiveRecord::Migration 
- Parent class takes care of most of the behind the scenes work, we just handle #up and #down
			
			class CreateProducts < ActiveRecord::Migration[5.1]
			  def up
			    create_table :products do |t|
			      t.string :name
			      t.text :description

			      t.timestamps
			    end
			  end

			  def down
			    drop_table :products
			  end
			end
- The above migration adds a table called 'products' with a string column called 'name' and a text column called 'description'
- A primary key column called 'id' is default, and implicitly added. So is 'created_at' and 'updated_at'
- The migration can be undone using down or the change method 

			class CreateProducts < ActiveRecord::Migration[5.1]
			  def change
			    remove_column :products, :description
			  end
			end


# Generating Migrations
- To create a new migration called you run "rails generate migration <<Migration Name>>" 
- Migrations are stored in the db/migrate directory, one for each migration class
- The name of the file is timestamp_name.rb. The name should correspond to the associated class


# Writing a Migration
- Inside up/down or change methods you can call methods of the parent class ActiveRecord:Migration[5.1]
- Common commands include
	- Creating Tables
		- 'create_table' creates a products tablewith column called 'name' and 'price'
		- implicitly adds id and timestamp columns
		- object yielded to the block allows you to create columns on the table
				t.data_type :column_name, { option1: :option_value, option2: :option_value }

		- supported column types include :boolean, :date, :datetime, :float, :integer, :string, :text, :time
				
				create_table :products do |t|
				  t.string :name
				  t.float :price

				  t.timestamps
				end

	- Changing tables
		- add_column :table_name, :column_name, :type, options_hash
		- remove_column :table_name, column_name
		- rename_column :table_name, :old_column_name, :new_column_name
		- rename_table :old_table_name, :new_table_name
		- add_index :table_name, [:column1, :column2], options_hash
		- change_column :table_name, :column_name, :type, :options_hash
			- this can change the datatype of a column
			- add the option 'null: false' to add a NOT NULL constraint
			- add the option 'default: value' to specify a default value 
		Note: If you remove or change columns, you need to manually write the up/down methods so the object knows how to reverse it

				def change
				  add_column :applications, :user_id, :integer
				end

	- Timestamps
		- Active record provides shortcuts for common functionality 
		- It automatically adds "created_at" and "updated_at" columns with timestamps (.timestamps)

- Migrations can also run arbitrary code to modify or make use of data passed into it. 
- This is helpful to fix bad data or to populate new fields


# Running Migrations
- To run the migrations you have written, simply command 'rails db:migrate'. This is when the database is actually modified.db
- It runs all pending migrations that have not been previous run. Which migrations have been run is stored in a database 'schema_migrations'


# Do not edit old migrations
- You might make a mistake when writing migrations and run it
- In this case do not edit the old migration. Rails already thinks it ran it
- It is extremely bad practiced to edit old migrations, that could involve losing all of your data 
- Instead, make new migrations


# Rolling Back Migrations
- WE STRONGLY DISCOURAGE STUDENTS FROM EVERY ROLLING BACK. IT IS NOT AN OPTION DURING PRODUCTION
- That said, you can rollback by running "rails db:rollback" which will call all the down methods so


# Schema File
- The db/schema.rb is one big migration that ActiveRecord generates. 
- Each time you run a migration, ActiveRecord will examine the resulting schema of the entire database, and dump this description into schema.rb
- You can load into a database a description of the current schema with "rails db:schema:load"
- The schema file should be checked into source control and tracked
- The schema file is also useful if you want a quick look at what attributes an ActiveRecord object has, neatly summed update

