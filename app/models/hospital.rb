class Hospital < ApplicationRecord
  has_many :doctors
  has_many :patients, through: :doctors

  def number_of_doctors
    self.doctors.count
  end

  def unique_unis
    self.doctors.select('university').distinct
  end
end
