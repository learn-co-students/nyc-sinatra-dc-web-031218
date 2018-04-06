require 'pry'

class FiguresController < ApplicationController
	# shows all figures
	get '/figures' do
		@figures = Figure.all
		erb '/figures/index'.to_sym
	end

	#make new figure
	get '/figures/new' do
		erb '/figures/new'.to_sym
	end

	#post that creates figures
	post '/figures' do
		binding.pry
		if params[:title] != ""
			@title = Title.find_or_create_by(params[:title])
		end
		@figure = Figure.create(params[:figure])

		#@landmark = Landmark.create? since we need to create or update a landmark
		redirect to "/figures/#{@figure.id}"
	end

	#show a specific figure by ID
	get '/figures/:id' do
		@figure = Figure.find(params[:id])
		erb '/figures/show'.to_sym
	end

	# edit a figure
	get '/figures/:id/edit' do
		@figures = Figure.find(params[:id])
		erb '/figures/edit'.to_sym
	end

	#this is the patch that will update the figure
	patch '/figures/:id' do
		@figure = Figure.find(param[:id])
		@figure.update()#need to enter each key/value pair that enters anything that is updated
		erb '/figures/show'.to_sym
	end

end
