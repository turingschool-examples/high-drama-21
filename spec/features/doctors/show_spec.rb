require 'rails_helper'

RSpec.describe 'doctors show page' do
  before(:each) do
    @hospital1 = Hospital.create!(name: "Grey Sloan Memorial Hospital")
    @hospital2 = Hospital.create!(name: "Pabus Hospital")

    @doctor1 = @hospital1.doctors.create!(name: "Miranda Bailey", specialty: "General Surgery", university: "Stanford University", hospital_id: @hospital1.id)
    @doctor2 = @hospital1.doctors.create!(name: "Loki Ross", specialty: "General Surgery", university: "Colorado Boulder University", hospital_id: @hospital2.id)

    @patient1 = @doctor1.patients.create!(name: "Thor", age: 1)
    @patient2 = @doctor1.patients.create!(name: "Apollo", age: 3)
    @patient3 = @doctor2.patients.create!(name: "Ian", age: 18)

    visit hospital_doctor_path(@hospital1, @doctor1)
  end

  describe 'shows' do
    it 'all attributes' do
      expect(page).to have_content(@doctor1.name)
      expect(page).to have_content(@doctor1.specialty)
      expect(page).to have_content(@doctor1.university)
    end
    it 'hospital belonging to doctor' do
      expect(page).to have_content(@hospital1.name)
      expect(page).to have_no_content(@hospital2.name)
    end
    it 'all patients' do
      expect(page).to have_content(@patient1.name)
      expect(page).to have_content(@patient2.name)
      expect(page).to have_no_content(@patient3.name)
    end
  end

  describe 'deletes' do
    it 'has a link to remove patient' do
      click_link("Delete #{@patient1.name}")
      expect(page).to have_current_path(hospital_doctor_path(@hospital1, @doctor1))
    end
    xit 'deletes patient'do
      expect(page).to have_no_content(@patient1.name)
    end
  end
end
