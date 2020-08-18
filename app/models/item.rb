class Item

  attr_accessor :name, :quantity

  @@all = []

  def initialize(name:, quantity:)
    @name = name
    @quantity = quantity
    @@all << self
  end

  def self.all
    @@all
  end

end
