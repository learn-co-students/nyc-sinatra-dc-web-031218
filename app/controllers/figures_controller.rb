class FiguresController < ApplicationController


  set :views, Proc.new { File.join(root, "../views/") }
  register Sinatra::Twitter::Bootstrap::Assets


    ##CREATE
  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all

    erb :'figures/new'
  end

  post '/figures' do
    @figure = Figure.create(params[:figure])

    redirect to "figure/#{@figure.id}"
  end


  ##READ
  get '/figures' do
    @figures = Figure.all

    erb :'figures/index'
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])

    erb :'figures/show'
  end

  ##UPDATE
  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    @titles = Title.all
    erb :'/figures/edit'
  end

  patch '/figures/:id' do
  	@titles = Titles.all 
  	@landmarks = Landmark.all
    @figure = Figure.find(params[:id])
    @figure.update(name: params[:figure][:name], year_completed: params[:figure][:year_completed], 
                    figure_id: params[:figure][:figure_id])

    redirect to "/figures/#{@figure.id}"
  end


  ##DELETE
  delete '/figures/:id/delete' do
    @figure = Figure.find(params[:id]).destroy

    redirect to "/figures"

  end



end
