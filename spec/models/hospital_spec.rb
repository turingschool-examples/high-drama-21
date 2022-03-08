require 'rails_helper'

RSpec.describe Hospital do
  let!(:hospital_1) {Hospital.create!(name: "St. Jude's")}
  let!(:hospital_2) {Hospital.create!(name: "Presbyterian")}

  let!(:doctor_1) {hospital_1.doctors.create!(name: "Dr. Charles Nichols", specialty: "Vascular Surgery", university: "NYU Grossman")}
  let!(:doctor_2) {hospital_1.doctors.create!(name: "Dr. Richard Kimble", specialty: "Podiatry", university: "Yale Medical")}
  let!(:doctor_3) {hospital_1.doctors.create!(name: "Dr. Norm MacDonald", specialty: "Dermatology", university: "Yale Medical")}

  let!(:patient_1) {Patient.create!(name: "Billy McFarland", age: 38)}
  let!(:patient_2) {Patient.create!(name: "Ja Rule", age: 55)}
  let!(:patient_3) {Patient.create!(name: "Terry Crews", age: 58)}
  let!(:patient_4) {Patient.create!(name: "Henry Kissinger", age: 91)}

  let!(:doctor_patient_1) {DoctorPatient.create!(patient_id: patient_1.id, doctor_id: doctor_1.id)}
  let!(:doctor_patient_2) {DoctorPatient.create!(patient_id: patient_2.id, doctor_id: doctor_1.id)}
  let!(:doctor_patient_3) {DoctorPatient.create!(patient_id: patient_3.id, doctor_id: doctor_2.id)}
  let!(:doctor_patient_4) {DoctorPatient.create!(patient_id: patient_4.id, doctor_id: doctor_2.id)}

  describe 'relationships' do
    it { should have_many(:doctors) }
  end

  describe 'instance methods' do
    it "Returns the total count of a hospital's working doctors" do
      expect(hospital_1.doctor_count).to eq(3)
    end

    it "Returns a unique list of universities that a hospital's doctor's attended" do
      expect(hospital_1.university_unique_list).to eq([doctor_1.university, doctor_3.university])
    end
  end
end
