require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

c1 = Cult.new("SpaghettiWorship", "San Diego", "2018", "Slogan stuff")
c2 = Cult.new("AnimeIsNormal", "I wish Japan", "2014", "Anime is normal")
c3 = Cult.new("Cathulu", "San Diego", "1901", "Octapus tentacles for everyone")

f1 = Follower.new("John", 31, "Try everything")
f2 = Follower.new("MiddleAgedLady", 46, "Single path only")
f3 = Follower.new("Sasuke-kun", 26, "Anime + tentacles...")
f4 = Follower.new("BabyYoda", 2, "...")

b1 = BloodOath.new("12/12/12", c1, f1)
f1.join_cult("12/12/12", c2)
f1.join_cult("12/12/12", c3)
b2 = BloodOath.new("10/10/10", c3, f2)
b3 = BloodOath.new("08/08/10", c3, f3)
f3.join_cult("12/12/12", c2)


binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits
