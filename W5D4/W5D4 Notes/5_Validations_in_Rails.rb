#
#
# VALIDATIONS
#
#
Validations are how to check that objects are correctly filled out before they go into the database. This is to 
ensure that only valid data is saved into the database. It might be important that every user provides a valid 
email address and mailing address. Validations keep garbage data out. It


# Validations vs. Constraints
- Rails validations are not the same as database constraints, although conceptually similar
- Both try to ensure data integrity and consistency, but validations operate in ruby code, not the database
- Validations 
	- Validations are defined inside models. Model-level validations live in the Rails world
	- They are very flexible, database agnostic, and convenient to test maintain and reuse
	- They are appropriate for validating user input, where generic errors (500 internal server error) are bad
	- There are built in helpers for common validations, making them easy to add
- Constraints 
	- Constraints are defined inside migrations using SQL
	- common restraints include "NOT NULL", "FOREIGN KEY", "UNIQUE INDEX"
	- stop bad data coming from other services (SQL scripts, database console, etc.)
	- Can be tortuous to write in SQL for complicated validations 
	- When a database constraint fails, a generic error is thrown that can be useless
- You will often use both validations and constraints together


# More on Validations
- Validations are ran when you call save/save! on a model. 
- If any fail, the object is marked as invalid and AR will not perform the INSERT or UPDATE operation
- If success, save will return true. Save! will raise errors if validations fails
- '.valid?' 
	- method that calls the validators when you use SAVE
	- can be used on the object in general
- '.errors'
	- returns an instance of ActiveModel::Errors can be used as a hash
	- The keys are attribute names, and the values are arrays of errors
	- Only useful AFTER validations have been run. Call .valid? first
- 'errors.full_messages'
	- a full arrray of human readable messages 




# Built-In Validators
'presence'
- The most common by far
- validates that specified attributes are not empty
- using the blank? method to check if the value is nil or a b lank string
- it can also check is the associated object exists 
- do not use this to check for the presence of the foreign key (order_id), check the presence of the object in
- DEFAULT ERROR: "X can't be empty"
			
			class Person < ApplicationRecord
			  # must have name, login, and email
			  validates :name, :login, :email, presence: true
			end


'uniqueness'
- helps to validate than an attributes value is unique 
- there is also a useful :scope option that can be used to specify other attributes used to limit the check
- DEFAULT ERROR: "X has already been taken"

			class Account < ApplicationRecord
			  # no two Accounts with the same email
			  validates :email, uniqueness: true
			end

			class Holiday < ApplicationRecord
			  # no two Holidays with the same name for a single year
			  validates :name, uniqueness: {
			    scope: :year,
			    message: 'should happen once per year'
			  }
			end


# Less Common Helpers
'format' : checks to see if a string matches a given regular expression
'length' : checks to see whether a string or array has appropriate lenght. Has options for maximum and minimum
'numericality' : can check greater_than/greater_than_or_equal_to or less_than/less_than_or_equal_to
'inclusion' : lets you specify an array of possible values. All others are invalid


# Warning
- Rails5 automatically validates the presence of belongs_to associations
- This needs to be overwritten to allow for NULL values in such fields 
- Add "optional: true" to the belongs_to association
- You should also refrain from validating the belongs_to associations


# Custom Validation Methods
- You can define custom validators privately inside the model object
- To throw an error, add a message to the errors hash 
- If an error is not specific to any one attribute, you can add the error to errors[:base]


# Custom Validator Classes
- custom validators are classes that extend 'ActiveModel::EachValidator'
- these are good when you want to reuse the same validations for multiple columns or models
- your validator class must implement a 'validate_each' method which takes three arguments: record, attribute name, values
			
			class EmailValidator < ActiveModel::EachValidator
			  CRAZY_EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

			  def validate_each(record, attribute_name, value)
			    unless value =~ CRAZY_EMAIL_REGEX
			      # we can use `EachValidator#options` to access custom options
			      # passed to the validator.
			      message = options[:message] || 'is not an email'
			      record.errors[attribute_name] << message
			    end
			  end
			end

			# app/models/person.rb
			class Person < ApplicationRecord
			  # Rails knows `:email` means `EmailValidator`.
			  validates :email, presence: true, email: true
			  # not required, but must also be an email
			  validates :backup_email, email: { message: 'isn\'t even valid' }
			end


# Misc Validation Options
- ':allow_nil / :allow_blank'
	- skips the validation when the value being validated is nil
- ':message'
	- validators come up with a default error message on your behalf
	- you can use a :message to control what error is reported to the user
- ':if'
	- sometimes it makes sense to validate an object only when a given predicate is satisfied
	- :if can be used to specify when the validation SHOULD happen 
- ':unless'
	- identical to if but specifies when the validation SHOULD NOT happen
			
			class Order < ApplicationRecord
			  validates :card_number, presence: true, if: :paid_with_card?

			  def paid_with_card?
			    payment_type == 'card'
			  end
			end