class Cult
    attr_reader :name, :location, :founding_year, :slogan, :follower

    @@all = []

    def initialize(name, location, founding_year, slogan)
        @name = name
        @location = location
        @founding_year = founding_year
        @slogan = slogan
        save
    end

    def minimum_age
        18
    end

    def self.all
        @@all
    end

    def save
        @@all.push(self)
    end

    def recruit_follower(initiation_date, follower)
        if follower.age > minimum_age 
        BloodOath.new(initiation_date, self, follower)
        else 
            "Your ass is too young, try again later"
        end 
    end

    def cult_peeps
        BloodOath.all.find_all do |oaths|
            oaths.cult == self
            # binding.pry
        end.map do |peeps|
            peeps.follower
        end
    end

    def cult_population
        cult_peeps.length
    end

    def self.find_by_name(cult)
        BloodOath.all.find do |oaths|
            oaths.cult.name == cult
        end.cult
    end

    def self.find_by_location(location)
        BloodOath.all.find_all do |oaths|
            oaths.cult.location == location
        end.map do |cults|
            cults.cult
        end.uniq
    end

    def self.find_by_founding_year(year)
        BloodOath.all.find_all do |oaths|
            oaths.cult.founding_year == year
        end.map do |cults|
            cults.cult
        end.uniq
    end

    def average_age
       cult_peeps.reduce(0) do |total, peeps|
        total += peeps.age
       end / cult_peeps.length
    end 

    def my_followers_mottos
        cult_peeps.map do |peeps|
            peeps.life_motto
        end
    end

    def self.least_popular
        @@all.min_by do |cults|
            cults.cult_population
        end
    end

    def self.most_common_location
        cultlocations = {}
        @@all.each do |cults|
            if !cultlocations[cults.location]
            cultlocations[cults.location] = 1
            else 
            cultlocations[cults.location] += 1
            end 
        end
        cultlocations.max_by do |location, num|
            num
        end[0]
    end
end
    
