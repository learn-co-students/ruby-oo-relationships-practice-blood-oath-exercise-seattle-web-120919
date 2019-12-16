class Follower
    attr_accessor :name, :life_motto, :cults
    attr_reader :age

    @@all = []

    def initialize(name, age, life_motto)
        @name = name
        @age = age
        @life_motto = life_motto
        @cults = []

        @@all << self
    end

    def cults
        return @cults
    end

    def join_cult(cult)
        # Add cult to list of cult
        @cults << cult

        # Create a new BloodOath to reflect the joining
        BloodOath.new(self, cult)
    end

    def self.all
        return @@all
    end

    def self.of_a_certain_age(age_limit)
        index = 0
        of_age = []
        while index < @@all.length
            if @@all[index].age >= age_limit
                of_age << @@all[index]
                index += 1
            end
        end
        return of_age
    end
end
