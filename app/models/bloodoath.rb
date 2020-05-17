class BloodOath
    attr_reader :initiation_date, :cult, :follower
    @@all = []

    # initiation date is a string, YYYY-MM-DD of this blood oath 
    def initialize(cult, follower, date= "2019-12-31")
        @initiation_date = date
        @follower = follower
        @cult = cult 
        @@all << self 
    end

    def self.all
        @@all
    end
    
end 