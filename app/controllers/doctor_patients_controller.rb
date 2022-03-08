class DoctorPatientsController < ApplicationController
  def destroy
    doctor = Doctor.find(params[:doctor_id])
    DoctorPatient.find(params[:dr_pt_id]).destroy
    redirect_to doctor_path(doctor.id)
  end

end
