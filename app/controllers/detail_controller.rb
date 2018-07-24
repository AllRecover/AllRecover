require 'detail_helper'

class DetailController < ApplicationController

    before_action :set_hospital, only: [:index, :create]

  def index

    hospitalInfo = DetailHelper::HospitalInfo.new
    @timetable = hospitalInfo.timetable(@hospital)
    @top5 = hospitalInfo.top5(@hospital)
    @getMdlrtSbjectInfoList = hospitalInfo.getMdlrtSbjectInfoList(@hospital)
    @hospeval = Hospeval.find(@hospital)
    p "================================"
    p @getMdlrtSbjectInfoList
    p "================================"

    @reviews = Review.where(hospital_id: @hospital.id).order(id: :desc)
  end

  def create
    if params[:comment]=="" ||params[:title].length ==""
      # flash 메시지 전달 필요
    else
      review = Review.create(
        hospital_id: params[:hospital_id],
        user_id: params[:user_id],
        title: params[:title],
        comment:params[:comment],
        like: 0,
        star: params[:star].to_i
      )
    end
      redirect_to :back
  end

  def update
  end

  def destroy
  end

  private
  def set_hospital
    @hospital = Hospital.find(params[:hospital_id])
  end
end
