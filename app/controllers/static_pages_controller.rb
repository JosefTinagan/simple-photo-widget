class StaticPagesController < ApplicationController

	def home
		@flickr_id = params[:flickr_id]
	end
end
