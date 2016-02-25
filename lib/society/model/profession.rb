module Society
  class Profession < Model
    attr_accessor :name
    has_many :people

    def self.farmer
      where(name: 'farmer').first_or_create
    end

    def self.lawyer
      where(name: 'lawyer').first_or_create
    end

    def self.merchant
      where(name: 'merchant').first_or_create
    end

    def self.sample
      [ farmer, lawyer, merchant ].sample
    end
  end
end
