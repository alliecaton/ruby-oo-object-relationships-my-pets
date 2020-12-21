class Cat

attr_accessor :owner, :mood
attr_reader :name

@@all = []


  def initialize(name, owner=self.owner, mood="nervous")
    @name = name 
    @owner = owner
    @mood = mood
    save
  end

  def save
    @@all << self
  end 

  def self.all
    @@all 
  end 


end