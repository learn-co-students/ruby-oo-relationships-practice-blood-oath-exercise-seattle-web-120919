require_relative '../config/environment.rb'
require 'date'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

amazon = Cult.new("Amazombies", "Seattle", 2015, "I have Prime")
google = Cult.new("Googlers", "Silicon Valley", 2012, "Google it")
microsoft = Cult.new("Micros", "Seattle", 2012, "I actually use Bing")
christina = Follower.new("Christina", 27, "Gotta catch 'em all'")
christinas_oath = BloodOath.new(amazon, christina)
google.recruit_follower(christina)
sean = Follower.new("Sean", 26, "Life is good")
google.recruit_follower(sean)
sean.join_cult(microsoft)

binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits