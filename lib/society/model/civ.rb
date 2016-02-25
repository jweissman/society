module Society
  class Civ < Model
    has_many :cities
    has_many :people, :through => :cities
    belongs_to :world
    attr_accessor :name, :age

    def self.generate
      create(
        age: 0,
        name: name_dictionary.sample,
        cities: [City.generate]
      )
    end

    def self.name_dictionary
      %w[ Maya Arabia Urukh ]
    end

    def iterate
      update(age: age+1)
      cities.each(&:iterate)
    end
  end
end
