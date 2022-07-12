require 'sqlite3'
require 'singleton'

class QuestionsDatabase < SQLite3::Database
    include Singleton

    def initialize
        super('questions.db')
        self.type_translation = true
        self.results_as_hash = true
    end


end

class Users
    attr_accessor :fname, :lname, :id
    def self.all
        data = QuestionsDatabase.instance.execute("SELECT * FROM users")
        data.map { |datum| Users.new(datum) }
    end

    def self.find_by_id(id)
        id = QuestionsDatabase.instance.execute(<<-SQL, id)
            SELECT
                *
            FROM
                users
            WHERE
                id = ?
        SQL
        return nil unless id.length > 0
        Users.new(id.first) # play is stored in an array!
    end


    def self.find_by_name(fname, lname)
        query = QuestionsDatabase.instance.execute(<<-SQL, fname, lname)
            SELECT
                *
            FROM
                users
            WHERE
                fname = ? AND lname = ?
        SQL
        return nil unless query.length > 0
        Users.new(query.first) # play is stored in an array!  
    end

    def initialize(options)
        @id = options['id']
        @fname = options['fname']
        @lname = options['lname']
    end

    def author_questions
        raise "#{self} not in database" if !self.id
 
        Questions.find_by_author_id(self.id)
    end

    def authored_replies
        raise "#{self} not in database" if !self.id
 
        Replies.find_by_user_id(self.id)
    end

end

class Questions
    attr_accessor :id, :title, :body, :author_id
    def self.all
        data = QuestionsDatabase.instance.execute("SELECT * FROM questions")
        data.map { |datum| Questions.new(datum) }
    end

    def self.find_by_id(id)
        id = QuestionsDatabase.instance.execute(<<-SQL, id)
            SELECT
                *
            FROM
                questions
            WHERE
                id = ?
        SQL
        return nil unless id.length > 0
        Questions.new(id.first) # play is stored in an array!
    end


    def self.find_by_author_id(author_id)
        author_id = QuestionsDatabase.instance.execute(<<-SQL, author_id)
            SELECT
                *
            FROM
                questions
            WHERE
                author_id = ?
        SQL
        return nil unless author_id.length > 0
        Questions.new(author_id.first) # play is stored in an array!
    end

    def initialize(options)
        @id = options['id']
        @title = options['title']
        @body = options['body']
        @author_id = options['author_id']
    end

    def author
        Users.find_by_id(author_id)
    end

    def replies
        Replies.find_by_question_id(id)
    end
end

class Questions_Follows
    attr_accessor :id, :author_id, :question_id
    def self.all
        data = QuestionsDatabase.instance.execute("SELECT * FROM question_follows")
        data.map { |datum| Questions_Follows.new(datum) }
    end

    def self.find_by_id(id)
        id = QuestionsDatabase.instance.execute(<<-SQL, id)
            SELECT
                *
            FROM
                questions_follows
            WHERE
                id = ?
        SQL
        return nil unless id.length > 0
        Questions_Follows.new(id.first) # play is stored in an array!
    end

    def self.followers_for_question_id(question_id)
        #return an array of user objects
        followers = QuestionsDatabase.instance.execute(<<-SQL, question_id)
            SELECT
                *
            FROM
                question_follows
            WHERE
                question_id = ?
        SQL

        followers
        Users.find_by_id()
    end
    # def self.followed_questions_for_user_id(user_id)
    #     #return an array of user objects
    #     Users.find_by_id(author_id)
    # end
    def initialize(options)
        @id = options['id']
        @author_id = options['author_id']
        @question_id = options['question_id']
    end
end

class Replies
    attr_accessor :id, :question_id, :parent_reply_id, :reply_body, :user_id
    def self.all
        data = QuestionsDatabase.instance.execute("SELECT * FROM replies")
        data.map { |datum| Replies.new(datum) }
    end

    def self.find_by_id(id)
        id = QuestionsDatabase.instance.execute(<<-SQL, id)
            SELECT
                *
            FROM
                replies
            WHERE
                id = ?
        SQL
        return nil unless id.length > 0
        Replies.new(id.first) # play is stored in an array!
    end

    def self.find_by_user_id(user_id)
        user_id = QuestionsDatabase.instance.execute(<<-SQL, user_id)
            SELECT
                *
            FROM
                replies
            WHERE
                user_id = ?
        SQL
        return nil unless user_id.length > 0
        Replies.new(user_id.first) # play is stored in an array!
    end

    def self.find_by_question_id(question_id)
        question_id = QuestionsDatabase.instance.execute(<<-SQL, question_id)
            SELECT
                *
            FROM
                replies
            WHERE
                question_id = ?
        SQL
        return nil unless question_id.length > 0
        Replies.new(question_id.first) # play is stored in an array!
    end

    def initialize(options)
        @id = options['id']
        @question_id = options['question_id']
        @parent_reply_id = options['parent_reply_id']
        @reply_body = options['reply_body']
        @user_id = options['user_id']
    end

    def author
        Users.find_by_id(user_id)
    end

    def question
        Question.find_by_id(user_id)
    end

    def parent_reply
        Replies.find_by_id(parent_reply_id)
    end

    def child_replies
        child_reply = QuestionsDatabase.instance.execute(<<-SQL, self.id)
            SELECT
                *
            FROM
                replies
            WHERE
                parent_reply_id = ?
        SQL
        return nil unless child_reply.length > 0
        child_reply.map {|reply| Replies.new(reply)}
    end
end

class Question_Likes
    attr_accessor :id, :user_id, :question_id, :likes
    def self.all
        data = QuestionsDatabase.instance.execute("SELECT * FROM question_likes")
        data.map { |datum| Question_Likes.new(datum) }
    end

    def self.find_by_id(id)
        id = QuestionsDatabase.instance.execute(<<-SQL, id)
            SELECT
                *
            FROM
                question_likes
            WHERE
                id = ?
        SQL
        return nil unless id.length > 0
        Question_Likes.new(id.first) # play is stored in an array!
    end

    def initialize(options)
        @id = options['id']
        @user_id = options['user_id']
        @question_id = options['question_id']
        @likes = options['likes']
    end
end