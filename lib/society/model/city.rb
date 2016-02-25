module Society
  class City < Model
    has_many :people
    belongs_to :civ

    attr_accessor :name, :age

    def self.generate
      create(
        age: 0,
        name: name_dictionary.sample,
        people: Array.new(10) {Person.generate}
      )
    end

    def self.name_dictionary
      %w[ Ur Medina Tokyo Qin ]
    end

    def iterate
      update(age: age+1)
      people.each(&:iterate)
    end
  end
end
