require 'pry'

class Owner #has many cats & dogs

  attr_accessor :pets
  attr_reader :species, :name
  
 @@all = []

def initialize(name)
  @name = name
  @species = "human"
  @@all << self
  # @pets = {dogs: [], cats: []}
end

def self.all
  @@all
end

def say_species
  # return "I am a human"
  "I am a #{species}."
end

def self.count
  self.all.count
end

def self.reset_all 
  self.all.clear 
end

def cats
  #enumerate
  Cat.all.select {|cat| cat.owner == self}


end

def dogs
  Dog.all.select {|dog| dog.owner == self}

end

def buy_cat(name)
  Cat.new(name, self)
end

def buy_dog(name)
  Dog.new(name, self)
end

def walk_dogs
  self.dogs[0].mood = "happy"

end

def feed_cats
  self.cats[0].mood = "happy"
end

def sell_pets
  self.cats[0].mood = "nervous"
  self.dogs.each {|dog| dog.mood = "nervous"}

  self.cats.each {|cat| cat.owner = nil}
  self.dogs.each {|dog| dog.owner =  nil }
end

def list_pets
  return "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."


end


end

