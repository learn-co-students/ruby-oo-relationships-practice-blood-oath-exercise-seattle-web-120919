class BloodOath
    attr_accessor :follower, :cult

    @@all = []

    def initialize(follower, cult)
        @follower = follower
        @cult = cult

        @@all << self
    end

    def initiation_date
        date = Time.now
        return "#{date.year}/#{date.month}/#{date.day}"
    end

    def self.all
        return @@all
    end


end