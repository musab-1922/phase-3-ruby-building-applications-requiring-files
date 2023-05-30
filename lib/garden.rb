class Plant
  attr_accessor :name, :garden

  def initialize(name:)
    @name = name
    @garden = nil
  end

  def self.all
    ObjectSpace.each_object(self).to_a
  end
end

class Garden
  attr_accessor :name

  def initialize(name:)
    @name = name
  end

  def plants
    Plant.all.select do |plant|
      plant.garden == self
    end
  end
end

lawn = Garden.new(name: 'Front Lawn')

basil = Plant.new(name: 'Basil')
basil.garden = lawn

cucumber = Plant.new(name: 'Cucumber')
cucumber.garden = lawn

p lawn.plants
