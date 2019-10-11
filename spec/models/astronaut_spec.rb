require 'rails_helper'

describe Astronaut, type: :model do
  describe 'Validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :age }
    it { should validate_presence_of :job }
  end

  describe 'Relationships' do
    it { should have_many :astronaut_missions}
    it { should have_many :missions}
  end

  describe 'class methods' do
    describe '#average_age' do
      @astronaut_1 = Astronaut.create(name: 'Sally Ride', age: 45, job: 'Commander')
      @astronaut_2 = Astronaut.create(name: 'Ellen Ochoa', age: 42, job: 'Physicist')
      @all = Astronaut.all

      it 'should calculate astronauts average age' do
        expect(@all.average_age).to eq(43.5)
      end
    end
  end
end
