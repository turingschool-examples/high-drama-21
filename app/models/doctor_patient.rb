class DoctorPatient < ApplicationRecord
  belongs_to :doctor
  belongs_to :patient

  def find_name
    Patient.find(self.patient_id).name
  end
end
