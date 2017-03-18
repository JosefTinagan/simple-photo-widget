require 'flickraw'

FlickRaw.api_key=ENV["FLICKR_API_KEY"]
FlickRaw.shared_secret=ENV["FLICKR_SECRET_KEY"]

new_b = flickr.places.find :query => "new brunswick"
latitude = new_b[0]['latitude'].to_f
longitude = new_b[0]['longitude'].to_f

radius = 1
args = {}
args[:bbox] = "#{longitude - radius}, #{latitude - radius },#{longitude + radius},#{latitude + radius}"

args[:min_taken_date] = '1890-01-01 00:00:00'
args[:max_taken_date] = '1920-01-01 00:00:00'
args[:accuracy] = 1
discovered_pictures = flickr.photos.search args
discovered_pictures.each{|p| url = FlickRaw.url p; puts url }