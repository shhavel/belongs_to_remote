class Base
  attr_accessor :id

  def initialize(id)
    self.id = id
    self.class.initialized_objects[id] = self
  end

  class << self
    def initialized_objects
      @initialized_objects ||= {}
    end

    def find(id)
      initialized_objects[id]
    end
  end
end
