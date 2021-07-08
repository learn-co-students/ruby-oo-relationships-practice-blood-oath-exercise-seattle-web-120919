require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

cult1 = Cult.new("Cult 1", "Location 1", 1990, "Slogan 1")
cult2 = Cult.new("Cult 2", "Location 2", 1992, "Slogan 2")
cult3 = Cult.new("Cult 3", "Location 3", 2003, "Slogan 3")
cult4 = Cult.new("Cult 4", "Location 4", 1992, "Slogan 4")


follower1 = Follower.new("Follower 1", 21, "Motto 1")
follower2 = Follower.new("Follower 2", 22, "Motto 2")
follower3 = Follower.new("Follower 3", 23, "Motto 3")
follower4 = Follower.new("Follower 4", 24, "Motto 4")

bloodOath1 = BloodOath.new(follower1, cult2)
bloodOath2 = BloodOath.new(follower2, cult2)
bloodOath3 = BloodOath.new(follower3, cult1)
bloodOath4 = BloodOath.new(follower4, cult1)
bloodOath5 = BloodOath.new(follower1, cult1)
bloodOath6 = BloodOath.new(follower2, cult4)
bloodOath7 = BloodOath.new(follower4, cult3)
bloodOath8 = BloodOath.new(follower3, cult4)

puts BloodOath.all

# Should create a new BloodOath
cult1.recruit_follower(follower2)
puts cult1.cult_population

# Should have a new BloodOath 
puts BloodOath.all

# Should create a new BloodOath
follower3.join_cult(cult3)
puts cult3.cult_population

# Should have a new BloodOath 
puts BloodOath.all

# BloodOath Methods
puts bloodOath1.initiation_date

# Follower Methods
puts Follower.of_a_certain_age(22)

# Cult Methods
puts Cult.find_by_name("Cult 3")
puts Cult.find_by_location("Location 1")
puts Cult.find_by_founding_year(1992)

binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits