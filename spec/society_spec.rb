require 'spec_helper'
require 'pry'
require 'society'

describe Person do
  subject!(:person) { Person.create(name: name, city: city, profession: profession) }
  let(:profession) { Profession.create(name: "woodworker") }

  let(:name)  { "Aloysius Finch" }
  let(:city)  { City.create(civ: civ) }
  let(:civ)   { Civ.create(world: world) }
  let(:world) { World.create }

  # some sanity checks
  it 'should have a name' do
    expect(person.name).to eq("Aloysius Finch")
  end

  describe "relationships" do
    it 'should have a city' do
      expect(person.city).to eq(city)
    end

    it 'should have a profession' do
      expect(person.profession).to eq(profession)
    end

    it 'should be in inverse relations' do
      expect(city.people.all).to eq([person])
      expect(profession.people.all).to eq([person])
    end

    it 'should be in inverse thru relations' do
      expect(civ.people.all).to eq([person])
      expect(world.people.all).to eq([person])
    end
  end
end

describe World do
  describe ".generate" do
    it 'should create civilizations' do
      expect { World.generate }.to change{Civ.count}.by(1)
    end

    it 'should create cities' do
      expect { World.generate }.to change{City.count}.by(1)
    end

    it 'should create people' do
      expect { World.generate }.to change{Person.count}.by(10)
    end
  end

  describe "#iterate" do
    it 'should change the age of the world' do
      world = World.generate
      expect{world.iterate}.to change{world.age}.by(1)
    end
  end
end
