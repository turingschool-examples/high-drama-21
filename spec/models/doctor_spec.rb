require 'rails_helper'

RSpec.describe Doctor do
  describe 'relationships' do
    it { should belong_to(:hospital) }
    it { should have_many(:doctor_patients) }
    it { should have_many(:patients).through(:doctor_patients)}
  end

  before :each do
    @hospital1 = Hospital.create!(name: "Grey Sloan Memorial Hospital")
    @hospital2 = Hospital.create!(name: "Mike Dani Memorial Hospital")
    @doctor1 = @hospital1.doctors.create!(name: "Miranda Bailey", specialty: "General Surgery", university: "Stanford University")
    @doctor2 = @hospital1.doctors.create!(name: "Bob Lemon", specialty: "Heart", university: "NYU")
    @doctor3 = @hospital2.doctors.create!(name: "Sarah Lime", specialty: "Lung", university: "Ga Tech")
    @doctor4 = @hospital2.doctors.create!(name: "Tenzin Davidy", specialty: "Foot", university: "CDMX Univ")
    @doctor5 = @hospital2.doctors.create!(name: "Cathy Marie", specialty: "Brain", university: "Cali University")
    @patient1 = Patient.create!(name: 'Red', age: 32)
    @patient2 = Patient.create!(name: 'Apple', age: 17 )
    @patient3 = Patient.create!(name: 'Green', age: 29)
    @patient4 = Patient.create!(name: 'Blue', age: 87)
    @patient5 = Patient.create!(name: 'Orange', age: 4)
    @patient6 = Patient.create!(name: 'Yellow', age: 27)
    DoctorPatient.create!(doctor_id: @doctor1.id, patient_id: @patient1.id)
    DoctorPatient.create!(doctor_id: @doctor1.id, patient_id: @patient2.id)
    DoctorPatient.create!(doctor_id: @doctor2.id, patient_id: @patient3.id)
    DoctorPatient.create!(doctor_id: @doctor2.id, patient_id: @patient4.id)
    DoctorPatient.create!(doctor_id: @doctor3.id, patient_id: @patient5.id)
    DoctorPatient.create!(doctor_id: @doctor3.id, patient_id: @patient6.id)
    DoctorPatient.create!(doctor_id: @doctor4.id, patient_id: @patient4.id)
    DoctorPatient.create!(doctor_id: @doctor4.id, patient_id: @patient2.id)
    DoctorPatient.create!(doctor_id: @doctor5.id, patient_id: @patient1.id)
    DoctorPatient.create!(doctor_id: @doctor5.id, patient_id: @patient3.id)

  end

  describe 'instance methods' do
    it '.hospital_name' do

     expect(@doctor2.hospital_name).to eq(@hospital1.name)
     expect(@doctor4.hospital_name).to eq(@hospital2.name)
   end

    it '.all_patients' do

     expect(@doctor2.all_patients).to eq([@patient3, @patient4])
     expect(@doctor4.all_patients).to eq([@patient2, @patient4])
    end
  end
end
