require 'rails_helper'

RSpec.describe Person, type: :model do
  context 'assosciations' do
    it 'creates a mother, father and childs' do
      edilson = Person.create!(name: 'Edilson')
      marizete = Person.create!(name: 'Marizete')
      weslley = Person.create!(name: 'Weslley', mother: marizete, father: edilson)
      lucas = Person.create!(name: 'Lucas', mother: marizete, father: edilson)
      mateus = Person.create!(name: 'Mateus', mother: marizete, father: edilson)
      vanessa = Person.create!(name: 'Vanessa', mother: marizete, father: edilson)

      expect(weslley.father).to eq(edilson)
      expect(weslley.mother).to eq(marizete)
      expect(lucas.mother).to eq(marizete)
      expect(mateus.mother).to eq(marizete)
      expect(vanessa.mother).to eq(marizete)
      expect(marizete.children).to contain_exactly(weslley, lucas, mateus, vanessa)
    end
  end

  context '#siblings' do
    it 'returns all siblings' do
      edilson = Person.create!(name: 'Edilson')
      marizete = Person.create!(name: 'Marizete')
      weslley = Person.create!(name: 'Weslley', mother: marizete, father: edilson)
      lucas = Person.create!(name: 'Lucas', mother: marizete, father: edilson)
      mateus = Person.create!(name: 'Mateus', mother: marizete, father: edilson)
      vanessa = Person.create!(name: 'Vanessa', mother: marizete, father: edilson)

      expect(weslley.siblings).to contain_exactly(lucas, mateus, vanessa)
    end
  end

  context '#relatives' do
    it 'returns all siblings' do
      edilson = Person.create!(name: 'Edilson')
      marizete = Person.create!(name: 'Marizete')
      weslley = Person.create!(name: 'Weslley', mother: marizete, father: edilson)
      lucas = Person.create!(name: 'Lucas', mother: marizete, father: edilson)
      mateus = Person.create!(name: 'Mateus', mother: marizete, father: edilson)
      vanessa = Person.create!(name: 'Vanessa', mother: marizete, father: edilson)

      expect(weslley.relatives).to contain_exactly(edilson, marizete, lucas, mateus, vanessa)
    end
  end
end