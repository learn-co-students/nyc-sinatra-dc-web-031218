class FiguresController < ApplicationController


  set :views, Proc.new { File.join(root, "../views/") }
  register Sinatra::Twitter::Bootstrap::Assets

  get '/' do
  erb :'application/root'

  end



end
