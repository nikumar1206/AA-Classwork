#
Metaprogramming
- One of the powers of ruby is Reflection / Introspection, the ability for a program to examine itself
- For starters, we can ask an object what methods it will respond to
            obj = Object.new
            obj.methods # => [:nil?, :===, :=~, :eql?, :hash, :<=>, :class, ...]
- Object.methods returns an array of symbols, each the name of a method that can sent to the object 


Send
- We can call a method by name with .send 
            [].send(:count) # => 0
            [1,2,3].send(:max) # => 3
- this allows us to refer to methods like variables which can be passed as arguments into methods 
            def do_three_times(object, method_name)
                  3.times { object.send(method_name) }
            end


Define_method 
- We can even define new methods dynamically with .define_method
- with the below code, the ::makes_sound method will take in a symbol as an argument and create a new method around it
- this new method can then be called by any dog object 
            class Dog
                  def self.makes_sound(name)
                        define_method(name) { puts "#{name}"}
                  end
                  makes_sound(:woof)
            end
            dog = Dog.new
            dog.woof # => "woof"
- these types of methods that create methods are known as MACROS, 
- we have used a few MACROS before ('has_many', 'belongs_to', 'attr_accessor')



Method_missing
- when a method is called on an object, Ruby looks for an existing method with that name
- if it does not find one, it calls the Object.method_missing method, passing the method_name as a symbol along with any arguments
- the default version of this method simply raises an exception about the missing method, but you can override it for your own purposes
            class Cat 
                  def say(anything)
                        puts anything
                  end

                  def method_missing(method_name)
                        method_name = method_name.to_s
                        if method_name.start_with("say_")
                              text = method_name[('say'.length)..-1]
                              say(text)
                        else
                              super #raises an error
                        end
                  end
            end
- with the above code, now we can call any method that starts with .say_ and get a usable result
- Cat.say_hello # => puts 'hello' 
- be wary that overriding .method_missing can result in difficult to understand / debug code and should not be your first resort 
- a MACRO is preferred if the user just wants to define a small set of methods



Type Introspection
- we can also grab information about a class using introspective methods
- 'Object.class'
      - returns the type of class an object is
      - super useful for debugging, getting information to look up documentation
- 'Object.is_a?(Object)'
      - returns a boolean value
      - checks if the object the method is called on belongs to the class passed into the argument
- 'Object.superclass'
      - returns the class that an object extends / inherits from
      - can be chained multiple times # Object.superclass.superclass


Methods with Variable Argument Types 
- because Ruby does not require that we define the type of data any given variable or argument is, we can write methods that accept different types of arguments 
- for example, we might want a method that accepts strings but can also accept a hash with a string value, if we can convert it
            def perform_get(url)
                  if url.is_a?(Hash)
                        url = make_url(url) # some method that will convert a hash into a string value that we can use
                  end
                  # ...
            end
- this is uncommon but useful to know 


Class Instance Variables 
- you can have instance variables for an instance of a class
- but classes themselves are instances of objects, and can have instance variables too
            class Dog
                  # Fetches / assigns an instance variable @dogs, stored in the Dog object
                  def self.all
                        @dogs ||= []
                  end
                  # When the Dog class is initiliazed as an object, the new instance of Dog is added to the list of all Dogs
                  def initialize(name)
                        @name = name
                        self.class.all << self 
                  end
            end
            Dog.all # will return an array of all Dog objects
- when an instance variable is stored on a class, it is called a class instance variable
- they operate similarly to regular instance variables, similarly to how class methods function just like instance methods more or less

Inheritance
- a downside of calss instance variables is that they do not interact well with inheritance 
- if Corgi were to inherit from Dog, and we called Corgi.new, Corgi would not be added to the Dog.dogs list, but Corgi.dogs
- we can fix this by instantiating the @dogs variable as @@dogs
- @@dogs is a class variable, and these are shared between superclass and subclass
            class Dog  
                  def self.all
                        @@dogs ||= []
                  end

                  def initialize(name)
                        @name = name
                        self.class.all << self
                  end
            end

            class Husky < dog 
            end

            class Corgi < dog
            end

            h = Husky.new("Rex")
            c = Corgi.new("Bob")
            Dog.all # => #<Husky:0x007f95421b5560 @name="Rex">, #<Corgi:0i007f16432b5560 @name="Bob">]


Global Variables
- prefixed with a '$', these are top level variables that live outside of any class and are accessible anywhere
- global variables should be avoided, there is seldom a good reason to store variables globally
- exceptions include $stdin and $stdout variables, which contain File objects that can be used to read/white to the user
- puts and gets are methods of these global classes 


