module Society
  class Person < Model
    belongs_to :profession
    belongs_to :city

    attr_accessor :name, :age

    def self.generate
      create(
        name: name_dictionary.sample,
        age: (18..65).to_a.sample,
        profession: Profession.sample
      )
    end

    def self.name_dictionary
      %w[ Alice Bob Charlie Eve Susan ]
    end

    def iterate
      update(age: age+1)
    end
  end
end
