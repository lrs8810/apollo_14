require 'rails_helper'

RSpec.describe 'From astronaut index page' do
  it 'user can see all astronauts' do
    @astronaut_1 = Astronaut.create(name: 'Sally Ride', age: 45, job: 'Commander')
    @astronaut_2 = Astronaut.create(name: 'Ellen Ochoa', age: 42, job: 'Physicist')

    visit '/astronauts'

    expect(page).to have_content('Name: Sally Ride')
    expect(page).to have_content('Age: 45')
    expect(page).to have_content('Job: Commander')

    expect(page).to have_content('Name: Ellen Ochoa')
    expect(page).to have_content('Age: 42')
    expect(page).to have_content('Job: Physicist')
  end

  it 'user can see average age of astronauts' do
    @astronaut_1 = Astronaut.create(name: 'Sally Ride', age: 45, job: 'Commander')
    @astronaut_2 = Astronaut.create(name: 'Ellen Ochoa', age: 42, job: 'Physicist')

    visit '/astronauts'

    expect(page).to have_content('Average age: 44')
  end

  it 'user can see alphabetically ordered missions for each astronaut' do
    @astronaut_1 = Astronaut.create(name: 'Sally Ride', age: 45, job: 'Commander')
    @astronaut_2 = Astronaut.create(name: 'Ellen Ochoa', age: 42, job: 'Physicist')
    @astro1_mission1 = Mission.create(title: 'Gemini 13', time_in_space: 56)
    @astro1_mission2 = Mission.create(title: 'Apollo 11', time_in_space: 96)
    @astro1_mission3 = Mission.create(title: 'Saturn 12', time_in_space: 100)
    @astro2_mission1 = Mission.create(title: 'Saturn 14', time_in_space: 30)
    @astro2_mission2 = Mission.create(title: 'Capricon 12', time_in_space: 365)
    @astro3_mission3 = Mission.create(title: 'Apollo 11', time_in_space: 87)

    visit '/astronauts'

    within "#astro-#{@astronaut_1.id}" do
      expect(page).to have_content("Apollo 11")
      expect(page).to have_content("Gemini 13")
      expect(page).to have_content("Saturn 12")
    end

    within "#astro-#{@astronaut_2.id}" do
      expect(page).to have_content("Apollo 11")
      expect(page).to have_content("Capricon 12")
      expect(page).to have_content("Saturn 14")
    end
  end
end
