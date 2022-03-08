class DoctorPatientsController < ApplicationController
  def destroy
    doctor = Doctor.find(params[:doctor_id])
    patient = Patient.find(params[:patient_id])
    DoctorPatient.find_by(doctor_id: doctor.id, patient_id: patient.id).destroy
    # patient_remove.destroy
    redirect_to("/doctors/#{doctor.id}")

  end
end
