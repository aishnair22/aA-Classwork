require "sqlite3"
require "singleton"

class QuestionsDatabase < SQLite3::Database
    include Singleton
    def initialize
        super('questions.db')
        self.type_translation = true
        self.results_as_hash = true
    end
    
end


class User
    attr_accessor :fname, :lname, :id
    def self.find_by_id(id)
        arr_of_hashes = QuestionsDatabase.instance.execute(<<-SQL, id)
        SELECT 
            * 
        FROM 
            users 
        WHERE 
            id = ?
        SQL
        return nil if arr_of_hashes.empty?
        user = User.new(arr_of_hashes.first)
        user
    end

    def self.find_by_name(fname, lname)
        arr = QuestionsDatabase.instance.execute(<<-SQL, fname, lname)
        SELECT
            *
        FROM
            users
        WHERE
            fname = ? AND
            lname = ?
        SQL
        return nil if arr.empty?
        user = User.new(arr.first)
        user
    end

    def initialize(options)
        @id = options["id"]
        @fname = options["fname"]
        @lname = options["lname"]
    end

    def authored_questions()
        Question.find_by_author_id(id)
    end

    def authored_replies()
        Reply.find_by_user_id(id)
    end
end

class Question

    attr_accessor :id, :title, :body, :author_id
    def initialize(options_hash)
        @id = options_hash["id"]
        @title = options_hash["title"]
        @body = options_hash["body"]
        @author_id = options_hash["author_id"]
    end

    def self.find_by_id(id)
        arr = QuestionsDatabase.instance.execute(<<-SQL, id)
        SELECT *
        FROM questions
        WHERE id = ?
        SQL
        return nil if arr.empty?
        question = Question.new(arr.first)
        question
    end

    def self.find_by_title(title)
        arr = QuestionsDatabase.instance.execute(<<-SQL, title)
        SELECT *
        FROM questions
        WHERE title = ?
        SQL
        return nil if arr.empty?
        question = Question.new(arr.first)
        question
    end

    def self.find_by_author_id(author_id)
        arr = QuestionsDatabase.instance.execute(<<-SQL, author_id)
        SELECT *
        FROM questions
        WHERE author_id = ?
        SQL
        return nil if arr.empty?
        arr.map {|question| Question.new(question)}
    end

    def author()
        User.find_by_user_id(author_id)
    end

    def replies
        Reply.find_by_question_id(question_id)
    end

end

class QuestionFollow

    attr_accessor :id, :follower_id, :question_id

    def initialize(options_hash)
        @id = options_hash["id"]
        @follower_id = options_hash["follower_id"]
        @question_id = options_hash["question_id"]
    end
    
    def self.find_by_id(id)
        arr = QuestionsDatabase.instance.execute(<<-SQL, id)
        SELECT
        *
        FROM
        question_follows
        WHERE
        id = ?
        SQL
        return nil if arr.empty?
        question_follow = QuestionFollow.new(arr[0])
        question_follow
    end

    def self.followers_for_question_id(question_id)
        arr = QuestionsDatabase.instance.execute(<<-SQL, question_id)
        SELECT *
        FROM question_follows
        JOIN users ON question_follows.follower_id = users.id
        WHERE question_follows.question_id = ?
        SQL
        arr.map {|follower| User.new(follower)}
    end
end

class Reply
    attr_accessor :id, :question_id, :parent_reply_id, :author_id

    def initialize(options_hash)
        @id = options_hash['id']
        @question_id = options_hash['question_id']
        @parent_reply_id = options_hash['parent_reply_id']
        @author_id = options_hash['author_id']
        @body = options_hash['body']
    end

    def self.find_by_id(id)
        arr = QuestionsDatabase.instance.execute(<<-SQL, id)
        SELECT
        *
        FROM
        replies
        WHERE
        id = ?
        SQL
        return nil if arr.empty?
        reply = Reply.new(arr[0])
        reply
    end

    def self.find_by_user_id(user_id)
        arr = QuestionsDatabase.instance.execute(<<-SQL, user_id)
        SELECT *
        FROM replies
        WHERE user_id = ?
        SQL
        return nil if arr.empty?
        arr.map {|reply| Reply.new(reply)}
    end

    def self.find_by_question_id(question_id)
        arr = QuestionsDatabase.instance.execute(<<-SQL, question_id)
        SELECT *
        FROM replies
        WHERE question_id = ?
        SQL
        return nil if arr.empty?
        arr.map {|reply| Reply.new(reply)}
    end

    def author
        User.find_by_id(author_id)
    end

    def question
        Question.find_by_id(question_id)
    end

    def parent_reply
        Reply.find_by_id(parent_reply_id)
    end

    def child_replies
        arr = QuestionsDatabase.instance.execute(<<-SQL, self.id)
        SELECT *
        FROM replies
        WHERE parent_reply_id = ?
        SQL
        return nil if arr.empty?
        arr.map {|reply| Reply.new(reply)
    end
end

class QuestionLike

    def initialize(options)
        @id = options["id"]
        @question_id = options["question_id"]
        @liker_id = options["liker_id"]
    end

   def self.find_by_id(id)
        arr = QuestionsDatabase.instance.execute(<<-SQL, id)
        SELECT
        *
        FROM
        question_likes
        WHERE
        id = ?
        SQL
        return nil if arr.empty?
        question_like = QuestionLike.new(arr[0])
        question_like
    end
end