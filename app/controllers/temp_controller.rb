class TempController < ApplicationController

  def index
    @client_location = params[:location]

    # habaak
  end
  def map
    #test
  end
  def find_location
      @client_location = params[:location]

      redirect_to "?location=#{@client_location}"
  end

  def search_hospital
    @hospital = Hospital.where('yadmnm LIKE ?', "%#{params[:query]}%").limit(14)

    @main_hos = @hospital[0..3]

    @sub_hos = @hospital[3..@hospital.length]

    p @sub_hos
    if @hospital.length <1
      #flash msg 담아서 던지기
      redirect_to :back
    else
      respond_to do |format| #요청에 따라 html.erb 와 js.erb로 이동
       format.html {redirect_to :back}
       format.js {render 'create_search_hospital'}
      end

    end
    def search_disease

    end

  end
end
