class Follower
    attr_reader :name, :age, :life_motto
    @@all = []

    def initialize(name, age, life_motto)
        @name = name
        @age = age
        @life_motto = life_motto
        @@all << self
    end

    def self.all 
        @@all
    end

    def blood_oaths
        BloodOath.all.find_all{|blood_oath| blood_oath.follower == self}
    end

    def cults 
        self.blood_oaths.map{|blood_oath| blood_oath.cult}
    end

    # def fellow_cult_members
    #     # find my cults
    #     self.cults.find_all{|cult| cult.followers}
    #     # find members of those cults
    #     # return the other members (not including myself and without repeats)
    # end

    def join_cult(cult)
        BloodOath.new(cult, self)
    end

    def self.most_active
        highest_activity = self.all.map{|follower| follower.cults.count}.max
        self.all.find_all{|follower| follower.cults.count == highest_activity}
    end

    def my_cults_slogans
        self.cults.each do |cult|
            puts cult.slogan
        end
    end

    def self.of_a_certain_age(age)
        self.all.find_all{|follower| follower.age >= age}
    end

    def self.top_ten
        self.all.sort_by{|follower| follower.cults.size}.take(10)
    end
end