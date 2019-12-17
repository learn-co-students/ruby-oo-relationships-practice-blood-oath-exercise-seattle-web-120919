class Follower
    attr_reader :name, :age, :life_motto

    @@all = []

    def initialize(name, age, life_motto)
        @name = name
        @age = age
        @life_motto = life_motto
        save
    end

    def self.all
        @@all
    end

    def save
        @@all.push(self)
    end

    def cults
        BloodOath.all.map do |oath|
            oath.cult.name
        end
    end

    def join_cult(initiation_date, cult)
        if self.age > cult.minimum_age 
            BloodOath.new(initiation_date, cult, self)
        else 
            "Your ass is too young, try again later"
        end 
    end

    def self.of_a_certain_age(certainage)
        BloodOath.all.find_all do |oath|
            # binding.pry
            oath.follower.age >= certainage
        end
    end

    def my_peeps
        BloodOath.all.find_all do |oath|
            oath.follower == self
        end.map do |peeps|
            peeps.cult
        end
    end

    def my_cults_slogans
        my_peeps.map do |cults|
            cults.slogan
        end
    end

    # def follow
    #     follower = {}
    #     @@all.each do |followers|
    #         follower[followers] = followers.my_peeps
    #     end
    #     follower
    # end

    def self.followednum
        followernum = {}
        @@all.each do |followers|
            followernum[followers] = followers.my_peeps.length
        end
        followernum
    end

    def self.most_active
        followednum.max_by do |follower, joined|
            joined
        end[0]
    end

    def self.top_ten
        sortedfollowednum = followednum.sort_by do |k, v|
            -v
        end
        sortedfollowednum.map do |follower|
            follower[0]
        end.take(10)
    end

    def fellow_cult_members
        culties = idunnohowelse
        culties.delete(self)
        culties
    end

    def idunnohowelse
        BloodOath.all.find_all do |oaths|
            my_peeps.each do |cults|
              cults == oaths.cult
            end
        end.map do |oaths|
            oaths.follower
        end.uniq
    end

end