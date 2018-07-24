require 'nokogiri'
require 'rest-client'
require 'open-uri'

module DetailHelper
  class HospitalInfo
        def timetable(hospital)
          ykiho = hospital.ykiho
          p ykiho
          apikey = "QaF1DC23RvHRq4cW5OWsAc4OdF2aocCEzPIVRqamSp5em%2F%2FmLWBcH28Yzp2685EqMzQE%2Fag155d5CBsXxim9Wg%3D%3D"

           url = "http://apis.data.go.kr/B551182/medicInsttDetailInfoService/getDetailInfo?ykiho="+ykiho+"&ServiceKey="+apikey
           p url
           name_xml = RestClient.get(url)
           name_doc = Nokogiri::XML(name_xml)


           h = Hash.from_xml(name_doc.to_xml)
           unless h['response']['body']['items'].nil?
             return h['response']['body']['items']['item']
           end
        end


        def top5(hospital)
          ykiho = hospital.ykiho
          url = "http://apis.data.go.kr/B551182/hospDiagInfoService/getClinicTop5List?ServiceKey=QaF1DC23RvHRq4cW5OWsAc4OdF2aocCEzPIVRqamSp5em%2F%2FmLWBcH28Yzp2685EqMzQE%2Fag155d5CBsXxim9Wg%3D%3D&ykiho="+ykiho

          name_xml = RestClient.get(url)
          name_doc = Nokogiri::XML(name_xml)

          h = Hash.from_xml(name_doc.to_xml)
          unless h['response']['body']['items'].nil?
            return h['response']['body']['items']['item']
          end
        end

        def getHospWhlAsmRstList(hospital)
          ykiho = hospital.ykiho
          url = "http://apis.data.go.kr/B551182/hospAsmRstInfoService/getHospWhlAsmRstList?ServiceKey=QaF1DC23RvHRq4cW5OWsAc4OdF2aocCEzPIVRqamSp5em%2F%2FmLWBcH28Yzp2685EqMzQE%2Fag155d5CBsXxim9Wg%3D%3D&ykiho="+ykiho

          name_xml = RestClient.get(url)
          name_doc = Nokogiri::XML(name_xml)

          h = Hash.from_xml(name_doc.to_xml)
          unless h['response']['body']['items'].nil?
            return h['response']['body']['items']['item']
          end
        end


    end
end
