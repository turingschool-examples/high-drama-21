require 'rails_helper'

RSpec.describe 'Hospital Show page', type: :feature do

  describe 'Show Hospital attributes' do

    before :each do
      @hospital1 = Hospital.create!(name: "Grey Sloan Memorial Hospital")
      @doctor1 = @hospital1.doctors.create!(name: "Miranda Bailey", specialty: "General Surgery", university: "Stanford University")
      @doctor2 = @hospital1.doctors.create!(name: "Bob Lemon", specialty: "Heart", university: "NYU")
      @doctor3 = @hospital1.doctors.create!(name: "Sarah Lime", specialty: "Lung", university: "NYU")

    end

   it 'hospital name number of doctors, and unique list of doctor universities' do

    visit hospital_path(@hospital1)

    expect(page).to have_content(@hospital1.name)
    expect(page).to have_content(@hospital1.number_of_doctors)
    expect(page).to have_content(@doctor1.university)
    expect(page).to have_content(@doctor2.university)

   end
  end
end
