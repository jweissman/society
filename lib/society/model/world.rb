module Society
  class World < Model
    has_many :civs
    has_many :cities, :through => :civs
    has_many :people, :through => :cities

    attr_accessor :age

    def self.generate
      create(age: 0, civs: [Civ.generate])
    end

    def iterate
      update(age: age+1)
      civs.each(&:iterate)
    end
  end
end
