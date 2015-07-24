class AnnouncementsController < ApplicationController

	def index
		@announcements = Announcement.all
	end

	def new
		@announcement = Announcement.new	
	end

	def create
		@announcement = Announcement.new(announcement_params)
		if @announcement.save
			redirect_to announcements_path
		else
			redirect_to :new
		end
	end

	def update
	end

	def destroy
	end

	private

	def announcement_params
		params.require(:announcement).permit(:image)
	end
end
