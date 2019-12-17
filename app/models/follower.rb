class Follower
    attr_accessor :age, :motto, :cult 
    attr_reader :name
    @@all = []

    def initialize(name, age, motto)
        @name = name
        @age = age
        @life_motto = motto
        @@all << self 
    end

    # returns an Array of this follower's cults
    # iterate over Cults, find follower = self, return cults
    def cults 
        oaths = BloodOath.all.find_all {|oath| oath.follower == self}
        oaths.map {|oath| oath.cult}
        # oaths = BloodOath.all.find_all do |oath| 
        #     oath.follower == self
        # end

        # oaths.map do|oath| 
        #     oath.cult
        # end 
    end

    # takes Cult instance, adds this follower to cult's list of followers 
    def join_cult(cult)
        BloodOath.new(cult, self)
    end

    def self.all #Array of all followers
        @@all
    end

    # returns an Array of followers who are the given age or older
    def self.of_a_certain_age(age)
        Follower.all.find_all {|followers| followers.age >= age}
    end
end
