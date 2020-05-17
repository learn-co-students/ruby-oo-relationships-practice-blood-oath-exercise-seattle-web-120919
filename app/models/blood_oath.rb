class BloodOath
    attr_reader :cult, :follower, :initiation_date
    @@all = [] 

    def initialize(cult, follower)
        @cult = cult
        @follower = follower
        @initiation_date = Date.today.to_s
        @@all << self
    end
    
    def self.all 
        @@all
    end

    def self.first_oath
        self.all[0].follower
    end
end