require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

cult1 = Cult.new("CultA", "NY", 2012, "NY State of Mind")
cult2 = Cult.new("CultB", "Seattle", 2020, "The Mts are Calling")
baby = Follower.new("Baby Spice", 35, "Girl Power")
posh = Follower.new("Posh Spice", 30, "Fashion Forward")
oath1 = BloodOath.new(cult1, baby, "2012-01-01")
oath2 = BloodOath.new(cult2, baby, "2016-06-16")
oath3 = BloodOath.new(cult2, posh, "2020-12-12")

binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits