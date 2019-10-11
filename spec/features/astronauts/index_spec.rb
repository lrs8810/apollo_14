require 'rails_helper'

RSpec.describe 'From astronaut index page' do
  before(:each ) do
    @astronaut_1 = Astronaut.create(name: 'Sally Ride', age: 45, job: 'Commander')
    @astronaut_2 = Astronaut.create(name: 'Ellen Ochoa', age: 42, job: 'Physicist')
    visit 'astronauts'
  end

  it 'user can see all astronauts' do

    expect(page).to have_content('Name: Sally Ride')
    expect(page).to have_content('Age: 45')
    expect(page).to have_content('Job: Commander')

    expect(page).to have_content('Name: Ellen Ochoa')
    expect(page).to have_content('Age: 42')
    expect(page).to have_content('Job: Physicist')
  end

  it 'user can see average age of astronauts' do
    expect(page).to have_content('Average age: 44')
  end
end
