class DoctorController < ApplicationController
  def show
    @hospital = Hospital.find(params[:hospital_id])
    @doctor = Doctor.find(params[:id])
  end
end
