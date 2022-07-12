# 
#
# ASSOCIATIONS 
#
#
To create migrations and store information, you need to set up foreign key references between entities. 
However, the naive methods for retrieving information from tables using these keys can be tedious and 
time consuming. We can actually construct assocations to store that info within the model classes
			
			class Course < ApplicationRecord
			  belongs_to(
			    :professor,
			    class_name: 'Professor',
			    foreign_key: :professor_id,
			    primary_key: :id
			  )
			end

			class Professor < ApplicationRecord
			  has_many(
			    :courses,
			    class_name: 'Course',
			    foreign_key: :professor_id,
			    primary_key: :id
			  )
			end

The 'belongs_to' and 'has_many' methods exist in a module named ActiveRecord::Associations::ClassMethods. 
These class methods define instance methods, in this case Course.professor and Professor.courses. 
Class methods like this are called MACROS.
			
			course.professor # the professor for a course
			# => SELECT
			#      professors.*
			#    FROM
			#      professors
			#    WHERE
			#      professors.id = ?
			#    LIMIT
			#      1
			#
			# The `?` is filled with `course.professor_id`; the LIMIT it not strictly
			# necessary, but expresses the intent that one record be returned.

			professor.courses # an array of the courses a professor teaches
			# => SELECT
			#      courses.*
			#    FROM
			#      courses
			#    WHERE
			#      courses.professor_id = ?
			#
			# The `?` is filled with `professor.id`.

Rails needs the primary_key and foreign_key attributes so that it knows how courses and professors are connected.
The class_name attribute is also necessary, since this tells Rails what other table to lookup, and what kind of 
model object to construct with the result. 


'belongs_to'
- sets up a connection that will fetch a single associated object
- use a belongs_to association when an object has a foreign key that points to associated record
- it is expecting the primary_keyto be unique. a belongs_to should only return one object has
- As of rails 5, 'belongs_to' associations are dalidated for presence by default
- You can opt out of this by adding 'optional: true' to the association
			
			class Course < ApplicationRecord
			  belongs_to(
			    :professor,
			    class_name: 'Professor',
			    foreign_key: :professor_id,
			    primary_key: :id
			  )
			end


'has_many'
- we use 'belongs_to' when the record holds a foreign key that references an associated object. 
- if we want to go in the opposite direction we use 'has_many'
- because the foreign key is not expected to be unique, it can yield multiple records 
- 'has_many' associations should be pluralized 
			
			class Professor < ApplicationRecord
			  has_many(
			    :courses,
			    class_name: 'Course',
			    foreign_key: :professor_id,
			    primary_key: :id
			  )
			end


'has_many :through'
- this method associates records through other tables
- a typical case is where two models are related in a many-to-many way by an intermediary join table  
- 'has_many :patients, through: :appointments, source: :patient'
	- :through and :source name other associations
	- You have to define those underlying associations first before you can stitch them through
- it is a two step process: first travel through the :through, then go through the :source
- it links up ASSOCIATIONS, not low-level details like 'class_name' or 'foreign_key'
		
		Example
			class Physician < ApplicationRecord
			  has_many(
			    :appointments,
			    class_name: 'Appointment',
			    foreign_key: :physician_id,
			    primary_key: :id
			  )

			  has_many :patients, through: :appointments, source: :patient
			end

			class Appointment < ApplicationRecord
			  belongs_to(
			    :physician,
			    class_name: 'Physician',
			    foreign_key: :physician_id,
			    primary_key: :id
			  )

			  belongs_to(
			    :patient,
			    class_name: 'Patient',
			    foreign_key: :patient_id,
			    primary_key: :id
			  )
			end

			class Patient < ApplicationRecord
			  has_many(
			    :appointments
			    class_name: 'Appointment',
			    foreign_key: :patient_id,
			    primary_key: :id
			  )

			  has_many :physicians, through: :appointments, source: :physician
			end

			physician.patients
			# SELECT
			#  patients.*
			# FROM
			#  appointments
			# JOIN
			#  patients ON appointments.patient_id = patients.id
			# WHERE
			#  appointments.physician_id = ?


'has_one'
- this is a has_many association where at most one associated record will exist
- instead of returning an empty or one-element array, has_one returns the associated object or nil
- this is sometimes used for tables with 'wide' columns that contain a lot of data


'has_one :through'
- this acts the same as 'has_many :through' but tells ActiveRecord that only one record should be returned
- is used to link up only 'belongs_to' and 'has_one' associations


'has_and_belongs_to_many' (HABTM)
- a way of defining a many-to-many association without requiring a model for the intervening join tables
- 'has_and_belongs_to_many' is a shortcut to writing multiple 'has_many :through' associations should
- APPACADEMY DOES NOT ADVISE THIS APPROACH


# Reflexive Associations
- when an association refers back to the same table 
- you should non-standard association names ('subordinates/manager instead of employee/employees')
			
			class Employee < ApplicationRecord
			  has_many :subordinates,
			    class_name: 'Employee',
			    foreign_key: :manager_id,
			    primary_key: :id

			  belongs_to :manager,
			    class_name: 'Employee',
			    foreign_key: :manager_id,
			    primary_key: :id
			end


# Two Associations to the Same Class
- below, the Email and User objects are associated in two ways: sender and recipient
- The email record does not reference the User id field directly, it refers to address
- for that reason, we need to specify the primary_key option; thi sis otherwise by default id
			
			# emails: id|from_email_address|to_email_address|text
			#  users: id|email_address

			class User < ApplicationRecord
			  has_many(
			    :sent_emails,
			    class_name: 'Email',
			    foreign_key: :from_email_address,
			    primary_key: :email_address
			  )
			  has_many(
			    :received_emails,
			    class_name: 'Email',
			    foreign_key: :to_email_address,
			    primary_key: :email_address
			  )
			end

			class Email < ApplicationRecord
			  belongs_to(
			    :sender,
			    class_name: 'User',
			    foreign_key: :from_email_address,
			    primary_key: :email_address
			  )
			  belongs_to(
			    :recipient,
			    class_name: 'User',
			    foreign_key: :to_email_address,
			    primary_key: :email_address
			  )
			end