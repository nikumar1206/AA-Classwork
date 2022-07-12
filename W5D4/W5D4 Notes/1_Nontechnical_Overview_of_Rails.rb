# 
#
# A NONTECHNICAL OVERVIEW OF RAILS
#
#

Rails is an MVC framework, a model view controller that divides an application into three basic parts.
- "Model" 
	- concerned with the retrieval of information from storage
	- any logic done to that information
- "View"
	- concerned with displaying information
- "Controller"
	- concerned with constructing the servers HTTP response
	- sends commands to the model to fetch or update information and to the view to display 
	- the interface between the model and the view

# Convention over Configuration
The default configuration is already programmed into the framework, and developers only need to be specific when 
being unconventional.  If we have a cats.db, the default model name is Cat and the default controller is CatsController.


# REST
Represental State Transfer in architectural style for web services. It allows access to web resources using standard
operations like GET, POST, pATCH, or DELETE. RESTful web services are stateless, which means each request/response cycle
is independent from every other. Data can be cached on the client side.db


# Rails Components
	- "ActiveRecord"
		- All models inherit from ActiveRecord, an ORM 
		- Allows us to represent data frmo a database as ruby objects 
		- Has a bunch of methods which implement basic CRUD (create, read, update, delete) functionality
	- "ActionController"
		- Handles the controller logic
		- Allows access to various cookies which can store small amounts of data such as info about the session
		- It can also provide protection from CSRF (cross site request forgery) attacks by checking for auth tokens
	- "ActionView"
		- Responsible for handling the views
		- Templates can take on several forms. One supported file type is ERB, or embedded ruby
		- Rails has build in helper methods that generate HTML that can be added to a view with ERB
	- "Rake"
		- A utility tool packaged with Rails that handles task management
		- It can be thought of as a scripting tool for Rails, used to carry out administrative tasks 
		- Migrating a database, displaying routes, or other custom tasks
	- "Rack"
		- A piece of middleware that sits between the Rails router and the web server (WEBrick or Puma)
		- It receives HTTPS requests from the server and generates responses using information from the router
		- Ensures every server can interface with every ruby framework
	- "WEBrick"
		- The HTTP server that comes standard with Rails 4
		- Written entirely in Ruby, easy and reliable to use
		- single-threaded: it can only handle a single request at a time
		- does not scale well and can suffer a lot of delay
		- good for development environment, but not production

# Other Frameworks
- 'Sinatra (Ruby)': much smaller and simpler than ruby, but can be useful for small apps
- 'Node.js (Javascript': part of MEAN stack, part of 4 apps used to create a full-stack app. Flexible, but slower
- 'Django (Python)': MVC framework written in python and follows principle of 'explicit better than implicit'. No good defaults
- 'Spring MVC (Java)': lots of resources, can be slow, lack of scalability
- 'Play! (Scala)': lacks plugins, faster language than ruby, can be more scalable
- 'ASP.NET MVC (.NET)': an MVC for .NET languages, like C#. Particularly suited for dev on windows devices. 
- 'Laravel (PHP)': most popular server-side langauge. easier lanuage to learn than ruby, but more verbose. requires explicit vs. implicit code





# INITIALIZING A RAILS PROJECT WITH POSTGRES 

		|| rails new demo_project -G --database=postgresql

Creates a folder demo_project. -G instructs rails to create a project without making a new git repo.

# Important gemfiles
		|| group :development do
				gem 'annotate'
				gem 'better_errors'
				gem 'binding_of_caller'
				gem 'byebug'
				gem 'pry-rails'
			end

# Postgres
You can switch an existing Rails app from SQlite to Postgres with the following
	1. Delete the .sqlite3 files in db/ 
	2. Replace the 'gem 'sqlite3'' line in the Gemfile with 'gem 'pg''. Bundle install
	3. Edit config/database.yml to use progress
		- change the default environment to "postgresql"
		- create a database with the given name. name development, test, and production databases as shown below
	4. Run 'bundle exec rails db:create'. If you have migrations, run 'bundle exec rails db:migrate'. If you have seeds, run 'bundle exec rails db:seed'

		development:
  			<<: *default
  			database: project_name_development


