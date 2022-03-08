require 'rails_helper'

RSpec.describe DoctorPatient, type: :model do
  it { should belong_to :patient }
  it { should belong_to :doctor }
end
