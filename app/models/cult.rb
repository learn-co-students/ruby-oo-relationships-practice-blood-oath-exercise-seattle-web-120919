class Cult
    attr_reader :name, :location, :founding_year, :slogan
    @@all = []

    def initialize(name, location, founding_year, slogan)
        @name = name
        @location = location
        @founding_year = founding_year
        @slogan = slogan
        @@all << self
    end

    def self.all 
        @@all
    end

    def average_age
        ages = self.followers.map{|follower| follower.age}
        ages.sum / ages.size.to_f
    end

    def cult_population
        BloodOath.all.find_all{|blood_oath| blood_oath.cult == self}.count
    end

    def self.find_by_founding_year(founding_year)
        self.all.find_all{|cult| cult.founding_year == founding_year}
    end

    def self.find_by_location(location)
        self.all.find_all{|cult| cult.location == location}
    end

    def self.find_by_name(name)
        self.all.find{|cult| cult.name == name}
    end

    def followers
        oaths = BloodOath.all.find_all{|blood_oath| blood_oath.cult == self}

        oaths.map{|blood_oath| blood_oath.follower}
    end

    def self.least_popular
        lowest_count = self.all.map{|cult| cult.followers.count}.min
        self.all.find_all{|cult| cult.followers.count == lowest_count}
    end

    def self.locations
        self.all.map{|cult| cult.location}
    end

    def self.most_common_location
        self.locations.max_by{|i| locations.count(i)}
    end

    def my_followers_mottos
        self.followers.each do |follower|
            puts follower.life_motto
        end
    end

    def recruit_follower(follower)
        BloodOath.new(self, follower)
    end
end