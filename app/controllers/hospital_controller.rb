class HospitalController < ApplicationController
  def show
    @hospital = Hospital.find(params[:id])
  end
end
