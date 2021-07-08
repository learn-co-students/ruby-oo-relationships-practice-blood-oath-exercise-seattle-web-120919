class Cult
    attr_accessor :name, :location, :slogan, :followers
    attr_reader :founding_year

    @@all = []

    def initialize(name, location, founding_year, slogan)
        @name = name
        @location = location
        @founding_year = founding_year
        @slogan = slogan
        @followers = []

        @@all << self
    end

    def recruit_follower(follower)
        # Add follower to list of followers
        @followers << follower

        # Create a new BloodOath to reflect the recruitment
        BloodOath.new(follower, self)
    end

    def cult_population
        return @followers.length
    end

    def self.all
        return @@all
    end

    def self.find_by_name(name)
        index = 0
        while index < @@all.length
            if @@all[index].name === name
                return @@all[index]
            end
        end
    end

    def self.find_by_location(location)
        index = 0
        while index < @@all.length
            if @@all[index].location === location
                return @@all[index]
            end
        end
    end

    def self.find_by_founding_year(founding_year)
        index = 0
        while index < @@all.length
            if @@all[index].founding_year === founding_year
                return @@all[index]
            end
        end
    end
end