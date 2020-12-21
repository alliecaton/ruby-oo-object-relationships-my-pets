require 'pry'

class Owner

attr_reader :name, :species

@@all = []

  def initialize(name, species="human")
    @name = name 
    @species = species
    save
  end 

  def say_species
    "I am a #{@species}."
  end

  def save
    @@all << self
  end 

  def self.all 
    @@all
  end 

  def self.count 
    self.all.count
  end

  def self.reset_all
    @@all.clear 
  end

#association methods

def cats
  Cat.all.select { |cat| cat if cat.owner == self }
end 

def dogs
  Dog.all.select { |dog| dog if dog.owner == self }
end 

def buy_cat(name)
  cat = Cat.new(name)
  cat.owner = self
  self.cats.count
end 

def buy_dog(name)
  dog = Dog.new(name)
  dog.owner = self
  self.dogs.count
end 

def walk_dogs
  self.dogs.each do |dog|
    dog.mood = "happy"
  end
end

def feed_cats
  self.cats.each do |cat|
    cat.mood = "happy"
  end
end 

def sell_pets
  all_pets = []
  all_pets = self.dogs + self.cats
  all_pets.each do |pet|
    pet.mood = "nervous"
    pet.owner = nil
  end 
  all_pets.clear
end

def list_pets
  "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
end


end