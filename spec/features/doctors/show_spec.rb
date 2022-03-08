require 'rails_helper'

RSpec.describe 'Doctor Show page', type: :feature do

  describe 'Show Doctor attributes' do

   it 'doctor name specialty, uni, hospital and patients' do

     hospital1 = Hospital.create!(name: "Grey Sloan Memorial Hospital")
     hospita2l = Hospital.create!(name: "Mike Dani Memorial Hospital")
     doctor1 = hospital1.doctors.create!(name: "Miranda Bailey", specialty: "General Surgery", university: "Stanford University")
     doctor2 = hospital1.doctors.create!(name: "Bob Lemon", specialty: "Heart", university: "NYU")
     doctor3 = hospital2.doctors.create!(name: "Sarah Lime", specialty: "Lung", university: "Ga Tech")
     doctor4 = hospital2.doctors.create!(name: "Tenzin Davidy", specialty: "Foot", university: "CDMX Univ")
     doctor5 = hospital2.doctors.create!(name: "Cathy Marie", specialty: "Brain", university: "Cali University")
     patient1 = Patient.create!(name: 'Red', age: 32)
     patient2 = Patient.create!(name: 'Apple', age: 17 )
     patient3 = Patient.create!(name: 'Green', age: 29)
     patient4 = Patient.create!(name: 'Blue', age: 87)
     patient5 = Patient.create!(name: 'Orange', age: 4)
     patient6 = Patient.create!(name: 'Yellow', age: 27)
     DoctorPatient.create!(doctor_id: doctor1.id., patient_id: patient1.id)
     DoctorPatient.create!(doctor_id: doctor1.id., patient_id: patient2.id)
     # DoctorPatient.create!(doctor_id: doctor2.id., patient_id: patient3.id)
     # DoctorPatient.create!(doctor_id: doctor2.id., patient_id: patient4.id)
     # DoctorPatient.create!(doctor_id: doctor3.id., patient_id: patient5.id)
     # DoctorPatient.create!(doctor_id: doctor3.id., patient_id: patient6.id)
     # DoctorPatient.create!(doctor_id: doctor4.id., patient_id: patient4.id)
     # DoctorPatient.create!(doctor_id: doctor4.id., patient_id: patient2.id)
     # DoctorPatient.create!(doctor_id: doctor5.id., patient_id: patient1.id)
    visit doctor_path(doctor1)

   expect(page).to have_content(doctor1.name)
   expect(page).to have_content(doctor1.specialty)
   expect(page).to have_content(doctor1.university)
   expect(page).to have_content(doctor1.hospital_name)
   expect(page).to have_content(doctor1.hospital_name)

   expect(page).to have_content(patient1.name)
   expect(page).to have_content(patient2.name)
   expect(page).to_not have_content(patient3.name)


   end
  end
end
   #
   # expect(page).to have_link()
   #
   # expect(current_path).to eq()
