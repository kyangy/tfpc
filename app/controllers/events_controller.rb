class EventsController < ApplicationController
include EventsHelper

	def index
		@events = Event.all
	end

	def show
		@event = Event.find(params[:id])
		address = @event.address
		google_maps(address)
	end

	def new
		@event = Event.new
	end

	def create
	  @event = Event.new(event_params)

	  respond_to do |format|
	    if @event.save
	      format.html { redirect_to @event, notice: 'Event was successfully created.' }
	      format.json { render action: 'show', status: :created, location: @event }
	    else
	      format.html { render action: 'new' }
	      format.json { render json: @event.errors, status: :unprocessable_entity }
	    end
	  end
	end

	private

	def event_params
		params.require(:event).permit(:title, :description, :start_time, :end_time, :image, :address)
	end
end
