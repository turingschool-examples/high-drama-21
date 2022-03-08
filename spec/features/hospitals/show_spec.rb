require 'rails_helper'

RSpec.describe 'hospital show page' do
  before(:each) do
    @hospital1 = Hospital.create!(name: "Grey Sloan Memorial Hospital")
    @hospital2 = Hospital.create!(name: "Pabus Hospital")

    @doctor1 = @hospital1.doctors.create!(name: "Miranda Bailey", specialty: "General Surgery", university: "Stanford University", hospital_id: @hospital1.id)
    @doctor2 = @hospital1.doctors.create!(name: "Miranda Bailey", specialty: "General Surgery", university: "Stanford University", hospital_id: @hospital1.id)
    @doctor3 = @hospital1.doctors.create!(name: "Loki Ross", specialty: "General Surgery", university: "Colorado Boulder University", hospital_id: @hospital2.id)

    visit hospital_path(@hospital1)
  end
  it 'shows name' do
    expect(page).to have_content(@hospital1.name)
    expect(page).to have_no_content(@hospital2.name)
  end
  it 'shows number of doctors in hospital' do
    expect(page).to have_content('3')
  end
  it 'shows universities of doctors once' do
    expect(page).to have_content('Standford University')
    expect(page).to have_content('Colorado Boulder University')
  end
end
