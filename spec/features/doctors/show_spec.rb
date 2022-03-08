require 'rails_helper'

RSpec.describe 'Doctors SHOW page' do
  let!(:hospital_1) {Hospital.create!(name: "St. Jude's")}
  let!(:hospital_2) {Hospital.create!(name: "Presbyterian")}

  let!(:doctor_1) {hospital_1.doctors.create!(name: "Dr. Charles Nichols", specialty: "Vascular Surgery", university: "NYU Grossman")}
  let!(:doctor_2) {hospital_1.doctors.create!(name: "Dr. Richard Kimble", specialty: "Podiatry", university: "Yale Medical")}

  let!(:patient_1) {Patient.create!(name: "Billy McFarland", age: 38)}
  let!(:patient_2) {Patient.create!(name: "Ja Rule", age: 55)}
  let!(:patient_3) {Patient.create!(name: "Terry Crews", age: 58)}
  let!(:patient_4) {Patient.create!(name: "Henry Kissinger", age: 91)}

  let!(:doctor_patient_1) {DoctorPatient.create!(patient_id: patient_1.id, doctor_id: doctor_1.id)}
  let!(:doctor_patient_2) {DoctorPatient.create!(patient_id: patient_2.id, doctor_id: doctor_1.id)}
  let!(:doctor_patient_3) {DoctorPatient.create!(patient_id: patient_3.id, doctor_id: doctor_2.id)}
  let!(:doctor_patient_4) {DoctorPatient.create!(patient_id: patient_4.id, doctor_id: doctor_2.id)}

  it "Shows the doctor's name" do
    visit "/doctors/#{doctor_1.id}"

    expect(page).to have_content(doctor_1.name)
    expect(page).to_not have_content(doctor_2.name)
  end

  it "Shows the doctor's specialty" do
    visit "/doctors/#{doctor_1.id}"

    expect(page).to have_content("Specialty: #{doctor_1.specialty}")
    expect(page).to_not have_content("Specialty: #{doctor_2.specialty}")
  end

  it "Shows the doctor's university" do
    visit "/doctors/#{doctor_1.id}"

    expect(page).to have_content("Medical School: #{doctor_1.university}")
    expect(page).to_not have_content("Medical School: #{doctor_2.university}")
  end

end
