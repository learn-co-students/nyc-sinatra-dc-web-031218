require 'pry'

class FiguresController < ApplicationController
	# shows all figures
	get '/figures' do
		@figures = Figure.all
		erb '/figures/index'.to_sym
	end

	#make new figure
	get '/figures/new' do
		@titles = Title.all
		@landmarks = Landmark.all
		erb '/figures/new'.to_sym
	end

	#post that creates figures
	post '/figures' do
		# binding.pry
		@figure = Figure.find_or_create_by(name: params[:figure][:name])

		if params[:title][:name] != ""
			title = Title.find_or_create_by(name: params[:title][:name])
			@figure.titles << title
		end

		params[:figure][:title_ids][0].keys.each do |title|
			binding.pry
			@figure.titles << Title.find_by(name: title)
		end

		if params[:landmark][:name] != ""
			landmark = Landmark.find_or_create_by(name: params[:landmark][:name], year_completed: params[:landmark][:year_completed])
			@figure.landmarks << landmark
		end

		params[:figure][:landmark_ids][0].keys.each do |landmark|
			@figure.landmarks << Landmark.find_by(name: landmark)
		end

		redirect to "/figures/#{@figure.id}"
	end

	# params
	# => {"figure"=>
	#   {"name"=>"HelpMeOut",
	#    "title_ids"=>
	#     [{"The Mayor"=>"on", "testingtestintesting"=>"on"}],
	#    "landmark_ids"=>
	#     [{"Flatiron School"=>"on", "Subway Station"=>"on"}]},
	#  "title"=>{"name"=>"OneMoreForToday"},
	#  "landmark"=>
	#   {"name"=>"HuuuugeLandmarks", "year_completed"=>"1234"}}



	#show a specific figure by ID
	get '/figures/:id' do
		@figure = Figure.find(params[:id])
		erb '/figures/show'.to_sym
	end

	# edit a figure
	get '/figures/:id/edit' do
		@figure = Figure.find(params[:id])

		@figure_titles = @figure.titles
		@titles = Title.all

		@figure_landmarks = @figure.landmarks
		@landmarks = Landmark.all
		
		erb '/figures/edit'.to_sym
	end

	#this is the patch that will update the figure
	patch '/figures/:id' do
		@figure = Figure.find(param[:id])
		@figure.update()#need to enter each key/value pair that enters anything that is updated
		erb '/figures/show'.to_sym
	end

end
