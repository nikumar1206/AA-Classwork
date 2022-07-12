class Bootcamp
    def initialize(name, slogan, student_capacity)
        @name = name
        @slogan = slogan
        @student_capacity = student_capacity
        @teachers = []
        @students = []
        @grades = Hash.new {|hash, k| hash[k] = []}
    end
    
    def name
        @name
    end

    def slogan
        @slogan
    end
    
    def teachers
        @teachers
    end

    def students
        @students
    end

    def hire(str)
        @teachers << str
    end

    def enroll(str)
        if @student_capacity > @students.length
            @students << str
            return true
        else
            return false
        end
    end

    def enrolled?(str)
        @students.include?(str)
    end

    def student_to_teacher_ratio
        (@students.length/@teachers.length).floor
    end
    
    def add_grade(str, num)
        if enrolled?(str)
            @grades[str] << num
            true
        else
            false
        end
    end

    def num_grades(str)
        @grades[str].length
    end

    def average_grade(str)
        return nil if !(enrolled?(str)) || @grades[str].empty?
        (@grades[str].sum/num_grades(str)).floor
    end

end
