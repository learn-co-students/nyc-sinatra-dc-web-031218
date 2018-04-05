class FiguresController < ApplicationController
	# create figure 
	get '/create_figure' do 
		erb :create
	end
	
	# edit a figure
	get '/:id/edit_figure' do 
	
	end

	patch '/edit_figure' do 

	end
end