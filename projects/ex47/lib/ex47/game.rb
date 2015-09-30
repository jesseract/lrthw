class Room
  attr_reader :name
  attr_reader :paths
  attr_reader :description


  def initialize(name, description)
    @name = name 
    @description = description 
    @paths = {}
  end

  def go(direction)
    return @paths[direction]
  end

  def add_paths(paths)
    @paths.update(paths)
  end
end
