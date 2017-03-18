module FlickrHelper

	def user_photos(user_id, photo_count = 12)
		FlickRaw.api_key=ENV["FLICKR_API_KEY"]
		FlickRaw.shared_secret=ENV["FLICKR_SECRET_KEY"]

		photos = flickr.photos.search(:user_id => user_id)
		temp = Array.new

		if photos.count > 11
			0.upto(photo_count-1) { |photo| temp << photos[photo]}
		else
			temp = photos
		end

		temp
	end

	def render_flickr_sidebar_widget(user_id, photo_count = 12, columns = 2)
		begin
			photos = user_photos(user_id, photo_count).to_a.in_groups_of(2)
			photos = photos.map { |x| x.compact }
			render :partial => '/flickr/sidebar_widget', :locals => { :photos => photos }
		rescue Exception
			render :partial => '/flickr/unavailable'
		end
	end
end