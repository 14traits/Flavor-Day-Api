namespace :tn do
  desc "TODO"
  require "uri"
  require "net/http"
  require "openssl"
  require "json"

  task load_data: :environment do
    url = URI("https://hosted.where2getit.com/culvers/rest/locatorsearch?like=0.5085979761547469&lang=en_EN")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Post.new(url)
    request["Accept"] = "application/json, text/javascript, */*; q=0.01"
    request["Content-Type"] = "application/json"
    request["Origin"] = "https://hosted.where2getit.com"
    request["Referer"] = "https://hosted.where2getit.com/"
    request["Content-Length"] = "358"
    request["Host"] = "hosted.where2getit.com"
    request["Accept-Language"] = "en-US,en;q=0.9"
    request["User-Agent"] = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.6.1 Safari/605.1.15"
    request["Connection"] = "keep-alive"
    request["X-Requested-With"] = "XMLHttpRequest"
    request.body = "{\"request\":{\"appkey\":\"1099682E-D719-11E6-A0C4-347BDEB8F1E5\",\"formdata\":{\"geoip\":false,\"dataview\":\"store_default\",\"geolocs\":{\"geoloc\":[{\"addressline\":\"Tennessee\",\"country\":\"\",\"latitude\":\"\",\"longitude\":\"\"}]},\"searchradius\":\"25|50|100\",\"stateonly\":1,\"where\":{\"comingsoondate\":{\"eq\":\"null\"},\"or\":{\"number\":{\"eq\":\"\"},\"onlineorderstatus\":{\"eq\":\"\"}}},\"false\":\"0\"}}}"

    response = http.request(request)
    data = response.body
    data = JSON.parse(data)

    f = 0
    l = 0
    j = 0

    data["response"]["collection"].each do
      Flavor.create(name: data["response"]["collection"][f]["flavor_day"],
                    image_url: data["response"]["collection"][f]["flavor_image2"],
                    cf_id: data["response"]["collection"][f]["flavor_id"])
      f += 1
    end

    data["response"]["collection"].each do
      Location.create(title: data["response"]["collection"][l]["name"],
                      latitude: data["response"]["collection"][l]["latitude"],
                      longitude: data["response"]["collection"][l]["longitude"],
                      address: data["response"]["collection"][l]["address1"],
                      city: data["response"]["collection"][l]["city"],
                      state: data["response"]["collection"][l]["state"],
                      postal_code: data["response"]["collection"][l]["postalcode"],
                      cl_id: data["response"]["collection"][l]["number"],
                      uid: data["response"]["collection"][l]["uid"])
      l += 1
    end

    data["response"]["collection"].each do
      if data["response"]["collection"][j]["number"] == "P" || data["response"]["collection"][j]["flavor_id"] == nil
        j += 1
      else
        fi = Flavor.find_by(cf_id: data["response"]["collection"][j]["flavor_id"])
        li = Location.find_by(cl_id: data["response"]["collection"][j]["number"])
        LocationFlavor.create(flavor_id: fi.id, location_id: li.id)
        j += 1
      end
    end
  end
end
