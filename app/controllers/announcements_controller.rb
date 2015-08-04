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

	def edit
		@announcement = Announcement.find(params[:id])
	end

	def update
		@announcement = Announcement.find(params[:id])
		if @announcement.update_attributes(announcement_params)
			redirect_to announcements_path
		else
			render :edit
		end
	end

	def destroy
		@announcement = Announcement.find(params[:id])
		if @announcement.destroy
			redirect_to announcements_path
		end
	end

	private

	def announcement_params
		params.require(:announcement).permit(:image)
	end
end
