require 'rails_helper'

RSpec.describe Hospital do
  describe 'relationships' do
    it { should have_many(:doctors) }
    it { should have_many(:patients).through(:doctors)}
  end
  before :each do
    @hospital1 = Hospital.create!(name: "Grey Sloan Memorial Hospital")
    @hospital2 = Hospital.create!(name: "Mike Dani Memorial Hospital")
    @doctor1 = @hospital1.doctors.create!(name: "Miranda Bailey", specialty: "General Surgery", university: "Stanford University")
    @doctor2 = @hospital1.doctors.create!(name: "Bob Lemon", specialty: "Heart", university: "NYU")
    @doctor3 = @hospital2.doctors.create!(name: "Sarah Lime", specialty: "Lung", university: "Ga Tech")
    @doctor4 = @hospital2.doctors.create!(name: "Tenzin Davidy", specialty: "Foot", university: "CDMX Univ")
    @doctor5 = @hospital2.doctors.create!(name: "Cathy Marie", specialty: "Brain", university: "CDMX Univ")
  end
  describe 'class methods' do
    it '.number_of_doctors' do

     expect(@hospital1.number_of_doctors).to eq(2)
     expect(@hospital2.number_of_doctors).to eq(3)
    end

    it '.unique_unis' do

     expect(@hospital1.unique_unis.count).to eq(2)
     expect(@hospital2.unique_unis.count).to eq(2)
    end
  end
end
