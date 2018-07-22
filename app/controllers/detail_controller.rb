class DetailController < ApplicationController
  def index
    @hos_id = params[:hos_id]
    @reviews = Review.where(hos_id: @hos_id).order(id: :desc)
  end

  def create
    if params[:comment]=="" ||params[:title].length ==""
      # flash 메시지 전달 필요
    else
      review = Review.create(
        hos_id: params[:hos_id],
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
end
