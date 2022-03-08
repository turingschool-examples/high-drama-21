class Hospital < ApplicationRecord
  has_many :doctors

  def doctor_count
    doctors.count
  end

  def university_unique_list
    doctors.distinct(:university).pluck(:university)
  end
end
