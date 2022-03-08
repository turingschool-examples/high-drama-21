class DoctorController < ApplicationController
  def show
    @hospital = Hospital.find(params[:hospital_id])
    @doctor = Doctor.find(params[:id])
  end

  def destroy
    @hospital = Hospital.find(params[:hospital_id])
    @doctor = Doctor.find(params[:id])

    redirect_to hospital_doctor_path(@hospital, @doctor)
  end
end
