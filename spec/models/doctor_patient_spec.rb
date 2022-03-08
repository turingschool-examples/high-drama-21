require 'rails_helper'
RSpec.describe DoctorPatient do
  describe 'relationships' do
    it { should belong_to(:doctor) }
    it { should belong_to(:patient) }
  end

  describe 'Instance methods' do

    hospital1 = Hospital.create!(name: "Grey Sloan Memorial Hospital")
    hospital2 = Hospital.create!(name: "Mike Dani Memorial Hospital")
    doctor1 = hospital1.doctors.create!(name: "Miranda Bailey", specialty: "General Surgery", university: "Stanford University")
    doctor2 = hospital2.doctors.create!(name: "Bob Lemon", specialty: "Heart", university: "NYU")

    patient1 = Patient.create!(name: 'Red', age: 32)
    patient2 = Patient.create!(name: 'Apple', age: 17 )
    patient3 = Patient.create!(name: 'Green', age: 29)

    dp1 = DoctorPatient.create!(doctor_id: doctor1.id, patient_id: patient1.id)
    dp2 = DoctorPatient.create!(doctor_id: doctor1.id, patient_id: patient2.id)
    dp3 = DoctorPatient.create!(doctor_id: doctor2.id, patient_id: patient3.id)

    it '.find_name' do

      expect(dp1.find_name).to eq(patient1.name)
      expect(dp2.find_name).to eq(patient2.name)
      expect(dp3.find_name).to eq(patient3.name)
    end
  end
end
