module EventsHelper

	def google_maps(address)
		address = address.gsub " ","+"
		map_api = ENV['GOOGLE_MAPS']
		@map = "https://www.google.com/maps/embed/v1/place?key=#{map_api}&q=#{address}"
	end
end
