class Cult 
    attr_accessor :slogan, :follower, :location, :founding_year 
    attr_reader :name
    @@all = []
    # @@follower_list = []

    def initialize(name, location, year, slogan)
        @name = name
        @location = location
        @founding_year = year
        @slogan = slogan
        @@all << self
    end
    
    # accepts and adds Follower instance to this cult's list of followers
    # access through BloodOath! 
    def recruit_follower(follower)
        BloodOath.new(self, follower)
    end

    # returns an Integer that is the number of followers in this cult
    def cult_population
        BloodOath.all.find_all do |oath|
            oath.cult == self
        end.size
    end 

    def self.all # returns an Array of all the cults
        @@all
    end 

    # find a Cult instance by name
    def self.find_by_name(name)
        Cult.all.find {|cults| cults.name == name}
    end

    # returns an Array of cults that are in that location
    def self.find_by_location(location)
        Cult.all.find_all {|cults| cults.location == location}
    end

    # returns all of the cults founded in that year
    def self.find_by_founding_year(year)
        Cult.all.find_all {|cults| cults.founding_year == year}
    end 
end 