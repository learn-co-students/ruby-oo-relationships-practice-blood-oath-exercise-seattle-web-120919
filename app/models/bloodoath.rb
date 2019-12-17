class BloodOath
    attr_reader :initiation_date, :cult, :follower

    @@all = []

    def initialize(initiation_date, cult, follower)
        @initiation_date = initiation_date
        @cult = cult
        @follower = follower
        save
    end

    def self.all
        @@all
    end

    def save
        @@all.push(self)
    end

    def self.first_oath
        @@all.first.follower
    end
end