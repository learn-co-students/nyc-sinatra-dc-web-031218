class LandmarksController < ApplicationController
	#view all landmarks
	get '/landmarks' do
    @landmarks = Landmark.all
		erb '/landmarks/index'.to_sym
	end

	#create new landmark
	get '/landmarks/new' do
    #this just goes to the 'new' page and take input and then will sned a post request
		erb '/landmarks/new'.to_sym
	end
	#when a user creates or edits a figure,
	#select or create new landmark or title

  #where the landmark is created then shows the new landmark
  post '/landmarks' do
    @landmark = Landmark.create(params)
    redirect to "/landmarks/#{@landmark.id}" #this views the new landmark
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    erb '/landmarks/show'.to_sym
  end

  #edits a single landmark
  get '/landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id])
    erb '/landmarks/edit'.to_sym
  end

  #patch for the landmark edit
  patch '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    @landmark.update() #need to enter key/value pairs to be updated
    erb '/landmark/show'.to_sym
  end






end
