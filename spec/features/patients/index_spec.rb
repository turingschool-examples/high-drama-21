require 'rails_helper'

RSpec.describe 'Patient Index page' do
  let!(:patient_1) {Patient.create!(name: "Billy McFarland", age: 38)}
  let!(:patient_2) {Patient.create!(name: "Ja Rule", age: 55)}
  let!(:patient_3) {Patient.create!(name: "Terry Crews", age: 58)}


end
