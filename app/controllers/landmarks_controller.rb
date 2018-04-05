class LandmarksController < ApplicationController

  set :views, Proc.new { File.join(root, "../views/") }
  register Sinatra::Twitter::Bootstrap::Assets

  ##CREATE
  get '/landmarks/new' do
    @figures = Figure.all

    erb :'landmarks/new'
  end

  post '/landmarks' do
    @landmark = Landmark.create(params[:landmark])

    redirect to "landmark/#{@landmark.id}"
  end


  ##READ
  get '/landmarks' do
    @landmarks = Landmark.all

    erb :'landmarks/index'
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])

    erb :'landmarks/show'
  end

  ##UPDATE
  get '/landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id])
    @figures = Figure.all
    erb :'/landmarks/edit'
  end

  patch '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    @landmark.update(name: params[:name], year_completed: params[:year_completed], figure_id: params[:figure_id])

    redirect to "/landmarks/#{@landmark.id}"
  end


  ##DELETE
  delete '/landmarks/:id/delete' do
    @landmark = Landmark.find(params[:id]).destroy

    redirect to "/landmarks"

  end


end
