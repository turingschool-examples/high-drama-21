class DoctorsController < ApplicationController
  def show
    @doctor = Doctor.find(params[:id])
  end

  def hospital_name
    Hospital.find(params[:hospital_id]).name
  end

  def all_patients
    self.patients
  end
end
