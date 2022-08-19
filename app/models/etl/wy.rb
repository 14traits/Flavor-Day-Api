require "uri"
require "net/http"
require "openssl"
require "json"

# require_relative "../app/controllers/flavors_controller.rb"
# require "../flavor.rb"
#include FlavorsController
require "../flavor"

url = URI("https://hosted.where2getit.com/culvers/rest/locatorsearch?like=0.3297938445016556&lang=en_EN")

http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true
http.verify_mode = OpenSSL::SSL::VERIFY_NONE

request = Net::HTTP::Post.new(url)
request["Accept"] = "application/json, text/javascript, */*; q=0.01"
request["Content-Type"] = "application/json"
request["Origin"] = "https://hosted.where2getit.com"
request["Referer"] = "https://hosted.where2getit.com/"
request["Content-Length"] = "443"
request["Host"] = "hosted.where2getit.com"
request["Accept-Language"] = "en-US,en;q=0.9"
request["User-Agent"] = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.6 Safari/605.1.15"
# request["Accept-Encoding"] = "gzip, deflate, br"
request["Connection"] = "keep-alive"
request["X-Requested-With"] = "XMLHttpRequest"
request.body = "{\"request\":{\"appkey\":\"1099682E-D719-11E6-A0C4-347BDEB8F1E5\",\"formdata\":{\"geoip\":false,\"dataview\":\"store_default\",\"geolocs\":{\"geoloc\":[{\"addressline\":\"Wyoming\",\"country\":\"US\",\"latitude\":43.0759678,\"longitude\":-107.2902839,\"state\":\"WY\",\"province\":\"\",\"city\":\"\",\"address1\":\"\",\"postalcode\":\"\"}]},\"searchradius\":\"25|50|100\",\"stateonly\":1,\"where\":{\"comingsoondate\":{\"eq\":\"null\"},\"or\":{\"number\":{\"eq\":\"\"},\"onlineorderstatus\":{\"eq\":\"\"}}},\"false\":\"0\"}}}"

response = http.request(request)
data = response.body

data = JSON.parse(data)

Flavor::load_data(data)

# i = 0
# data["response"]["collection"].each do
#   Flavor.create!(name: data["response"]["collection"][i]["flavor_day"],
#                  image_url: data["response"]["collection"][i]["flavor_image2"],
#                  cf_id: data["response"]["collection"][i]["flavor_id"])
#   FlavorController.dispatch(:create, data)

#   p data["response"]["collection"][i]["flavor_id"]
#   i += 1
# end
