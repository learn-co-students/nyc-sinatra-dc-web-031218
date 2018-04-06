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

    if params[:title][:name].present?
      @figure.titles << Title.create(name: params[:title][:name])
    end

    if params[:landmark][:name].present?
      @figure.landmarks << Landmark.create(name: params[:landmark][:name])
    end

    redirect to "/figures/#{@figure.id}"
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
    @landmarks = Landmark.all
    erb :'/figures/edit'
  end

  patch '/figures/:id' do
    @figure = Figure.find(params[:id])
    @figure.update(params[:figure])

    if params[:title][:name].present?
      @figure.titles << Title.create(name: params[:title][:name])
    end

    if params[:landmark][:name].present?
      @figure.landmarks << Landmark.create(name: params[:landmark][:name])
    end


    redirect to "/figures/#{@figure.id}"
  end


  ##DELETE
  delete '/figures/:id/delete' do
    @figure = Figure.find(params[:id]).destroy
    redirect to "/figures"

  end



end
