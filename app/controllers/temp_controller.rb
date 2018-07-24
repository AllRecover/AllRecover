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
    latlon = params[:location]
    latlon = latlon[1..(latlon.length-2)]
    latlon = latlon.split(", ")
    arr = [0,0]
    i = 0;
    latlon.each do |l|
      arr[i] =l.to_f
      i=i+1;
    end
    # p "***************************************************"
    # p arr
    # p "***************************************************"
    @main_hos = @hospital[0..3]
    @sub_hos = @hospital[3..@hospital.length]

    dist = []
    @hospital.each do |idx|
      dist << distance( arr, [idx.ypos.to_f,idx.xpos.to_f])
    end
    puts "++++++++++++++++++"
    puts dist

    @result =[]
    dist.sort.each do |d|
      idx = dist.index(d)
      p @hospital[idx]
      @result << @hospital[idx]
    end
    @main_hos = @result[0..3]
    @sub_hos = @result[3..@result.length]
    # p "***************************************************"
    # p dist
    # p "***************************************************"

    if @hospital.length <1
    #flash msg 담아서 던지기
      redirect_to :back
    else
      respond_to do |format| #요청에 따라 html.erb 와 js.erb로 이동
      format.html {redirect_to :back}
      format.js {render 'create_search_hospital'}
    end

  end



  end

  def search_disease

  end
  private
  def distance (loc1, loc2)
  rad_per_deg = Math::PI/180  # PI / 180
  rkm = 6371                  # Earth radius in kilometers
  rm = rkm * 1000             # Radius in meters

  dlat_rad = (loc2[0]-loc1[0]) * rad_per_deg  # Delta, converted to rad
  dlon_rad = (loc2[1]-loc1[1]) * rad_per_deg

  lat1_rad, lon1_rad = loc1.map {|i| i * rad_per_deg }
  lat2_rad, lon2_rad = loc2.map {|i| i * rad_per_deg }

  a = Math.sin(dlat_rad/2)**2 + Math.cos(lat1_rad) * Math.cos(lat2_rad) * Math.sin(dlon_rad/2)**2
  c = 2 * Math::atan2(Math::sqrt(a), Math::sqrt(1-a))

  rm * c # Delta in meters
  end

end
