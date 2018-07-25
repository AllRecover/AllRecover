class TempController < ApplicationController

  def index
    if params[:location].nil?
      p "nil"
      p @client_location="xx"
    else
      @client_location = params[:location]
    end


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

    dist = []
    asmgrd = []
    @hospital.each do |idx|
      dist <<( distance( arr, [idx.ypos.to_f,idx.xpos.to_f]) ).round(0)
      asmgrd11 = Hospeval.find_by(ykiho: idx.ykiho)[:asmgrd11]
      asmgrd12 = Hospeval.find_by(ykiho: idx.ykiho)[:asmgrd12]
      asmgrd13 = Hospeval.find_by(ykiho: idx.ykiho)[:asmgrd13]
      asmgrd_per = [asmgrd11,asmgrd12,asmgrd13]
      asmgrd << asmgrd_per

    u_dist= current_user.preference.dist
    u_price=current_user.preference.price
    u_grade=current_user.preference.grade
    u_list = [u_dist,u_price,u_grade]

    if u_list.max != u_dist
      ## default
      @main_asmgrd = asmgrd[0..3]
      @sub_asmgrd = asmgrd[3..@hospital.length]
      @main_hos = @hospital[0..3]
      @sub_hos = @hospital[3..@hospital.length]
      @dist_sub =dist[3..@hospital.length]
      @dist_main = dist[0..3]
    else
      @result =[]
      @result_asmgrd = []
      dist.sort.each do |d|
        idx = dist.index(d)
        #p @hospital[idx]
        @result << @hospital[idx]
        @result_asmgrd << asmgrd[idx]
      end
      dist =dist.sort
      @main_asmgrd =   @result_asmgrd[0..3]
      @sub_asmgrd =   @result_asmgrd[3..@hospital.length]
      @dist_sub =dist[3..@hospital.length]
      @dist_main = dist[0..3]
      @main_hos = @result[0..3]
      @sub_hos = @result[3..@result.length]
    end





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

  def search_sbj
    @hospital_non = Noncondition.where('middleclass LIKE ?', "%#{params[:query]}%").limit(14)
    @hospital =[]
    @hospital_non.each do |h|
      p "***************ykiho******************"
      p h.ykiho
      nil_check = Hospital.find_by(ykiho: h.ykiho)
      if nil_check.nil?
        nil_check ="null"
      end
      @hospital << nil_check
    end

    p "***************hos******************"
    p @hospital
    p "*********************************"
    p "*****************non****************"
    p @hospital_non
    p "*********************************"
    #@hospital = Hospital.where('yadmnm LIKE ?', "%#{params[:query]}%").limit(14)
    latlon = params[:location]
    latlon = latlon[1..(latlon.length-2)]
    latlon = latlon.split(", ")
    arr = [0,0]
    i = 0;
    latlon.each do |l|
      arr[i] =l.to_f
      i=i+1;
    end

    dist = []
    asmgrd = []
    @hospital.each do |idx|
      dist <<( distance( arr, [idx.ypos.to_f,idx.xpos.to_f]) ).round(0)
      asmgrd11 = Hospeval.find_by(ykiho: idx.ykiho)[:asmgrd11]
      asmgrd12 = Hospeval.find_by(ykiho: idx.ykiho)[:asmgrd12]
      asmgrd13 = Hospeval.find_by(ykiho: idx.ykiho)[:asmgrd13]
      asmgrd_per = [asmgrd11,asmgrd12,asmgrd13]
      asmgrd << asmgrd_per

      #subj =
    end


    u_dist= current_user.preference.dist
    u_price=current_user.preference.price
    u_grade=current_user.preference.grade
    u_list = [u_dist,u_price,u_grade]

    if u_list.max != u_dist
      ## default
      @main_asmgrd = asmgrd[0..3]
      @sub_asmgrd = asmgrd[3..@hospital.length]

      @main_hos = @hospital[0..3]
      @sub_hos = @hospital[3..@hospital.length]

      @dist_sub =dist[3..@hospital.length]
      @dist_main = dist[0..3]

      @main_non =   @hospital_non[0..3]
      @sub_non =   @hospital_non[3..@hospital.length]
    else
      @result =[]
      @result_asmgrd = []
      @result_non = []
      dist.sort.each do |d|
        idx = dist.index(d)
        #p @hospital[idx]
        @result << @hospital[idx]
        @result_asmgrd << asmgrd[idx]
        @result_non = @hospital_non[idx]
      end
      dist =dist.sort
      @main_non =   @result_non[0..3]
      @sub_non =   @result_non[3..@hospital.length]

      @main_asmgrd =   @result_asmgrd[0..3]
      @sub_asmgrd =   @result_asmgrd[3..@hospital.length]

      @dist_sub =dist[3..@hospital.length]
      @dist_main = dist[0..3]

      @main_hos = @result[0..3]
      @sub_hos = @result[3..@result.length]
    end


    if @hospital.length <1
    #flash msg 담아서 던지기
      redirect_to :back
    else
      respond_to do |format| #요청에 따라 html.erb 와 js.erb로 이동
      format.html {redirect_to :back}
      format.js {render 'create_search_hospital0'}
    end
  end
  end



  def search_cate
    @hospital_cate = Disease.where('shwsbjtcdnm LIKE ?', "%#{params[:query]}%").limit(14)
    @hospital =[]
    @hospital_cate.each do |h|
      p "***************ykiho******************"
      p h.ykiho
      nil_check = Hospital.find_by(ykiho: h.ykiho)
      if nil_check.nil?
        nil_check ="null"
      end
      @hospital << nil_check
    end

    p "***************hos******************"
    p @hospital
    p "*********************************"
    p "*****************non****************"
    p @hospital_cate
    p "*********************************"
    #@hospital = Hospital.where('yadmnm LIKE ?', "%#{params[:query]}%").limit(14)
    latlon = params[:location]
    latlon = latlon[1..(latlon.length-2)]
    latlon = latlon.split(", ")
    arr = [0,0]
    i = 0;
    latlon.each do |l|
      arr[i] =l.to_f
      i=i+1;
    end

    dist = []
    asmgrd = []
    @hospital.each do |idx|
      dist <<( distance( arr, [idx.ypos.to_f,idx.xpos.to_f]) ).round(0)
      asmgrd11 = Hospeval.find_by(ykiho: idx.ykiho)[:asmgrd11]
      asmgrd12 = Hospeval.find_by(ykiho: idx.ykiho)[:asmgrd12]
      asmgrd13 = Hospeval.find_by(ykiho: idx.ykiho)[:asmgrd13]
      asmgrd_per = [asmgrd11,asmgrd12,asmgrd13]
      asmgrd << asmgrd_per

      #subj =
    end


    u_dist= current_user.preference.dist
    u_price=current_user.preference.price
    u_grade=current_user.preference.grade
    u_list = [u_dist,u_price,u_grade]

    if u_list.max != u_dist
      ## default
      @main_asmgrd = asmgrd[0..3]
      @sub_asmgrd = asmgrd[3..@hospital.length]

      @main_hos = @hospital[0..3]
      @sub_hos = @hospital[3..@hospital.length]

      @dist_sub =dist[3..@hospital.length]
      @dist_main = dist[0..3]

      @main_non =   @hospital_cate[0..3]
      @sub_non =   @hospital_cate[3..@hospital.length]
    else
      @result =[]
      @result_asmgrd = []
      @result_non = []
      dist.sort.each do |d|
        idx = dist.index(d)
        #p @hospital[idx]
        @result << @hospital[idx]
        @result_asmgrd << asmgrd[idx]
        @result_non = @hospital_cate[idx]
      end
      dist =dist.sort
      @main_non =   @result_non[0..3]
      @sub_non =   @result_non[3..@hospital.length]

      @main_asmgrd =   @result_asmgrd[0..3]
      @sub_asmgrd =   @result_asmgrd[3..@hospital.length]

      @dist_sub =dist[3..@hospital.length]
      @dist_main = dist[0..3]

      @main_hos = @result[0..3]
      @sub_hos = @result[3..@result.length]
    end


    if @hospital.length <1
    #flash msg 담아서 던지기
      redirect_to :back
    else
      respond_to do |format| #요청에 따라 html.erb 와 js.erb로 이동
      format.html {redirect_to :back}
      format.js {render 'create_search_hospital00'}
    end
  end


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
