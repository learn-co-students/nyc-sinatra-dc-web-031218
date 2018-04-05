class LandmarksController < ApplicationController
	#read all landmarks 
	get '/read_landmarks' do 
		erb '/landmarks/index'.to_sym
	end
	#create new landmark
	get '/create_landmark' do 
		erb '/landmarks/new'.to_sym
	end
	#when a user creates or edits a figure, 
	#select or create new landmark or title
end
