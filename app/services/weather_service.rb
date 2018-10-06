require 'net/http'

class WeatherService
  def self.get(city)
    url = URI.parse(
      "http://api.openweathermap.org/data/2.5/weather?q=#{city}&appid=#{ENV['WEATHER']}"
    )
    req = Net::HTTP::Get.new(url.to_s)
    res = Net::HTTP.start(url.host, url.port) {|http|
      http.request(req)
    }
    data = JSON.parse res.body
    if not data["main"]
      return nil
    end
    {
      temperature: data["main"]["temp"],
      description: data["weather"][0]["description"],
      city: data["name"]
    }
  end
end
