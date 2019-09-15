
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end
  
  get '/articles/new' do 
    erb :new 
  end 
  
  post '/articles' do 
    Model.create(params[:title], params[:content])
    redirect_to '/articles/:id'
  end
  
  get '/articles' do
    @articles = Article.all 
    erb :index 
  end 
  
  get '/articles/:id' do 
    @article = Article.find(params[:id])
    erb :show 
  end 
  
  get '/articles/:id/edit'
    @article = Article.find(params[:id])
    erb :edit 
  end 
  
  patch 'articles/:id' do 
    Model.update(params[:id], params[:title], params[:content])
    redirect_to '/articles/:id'
  end 
  
  delete 'articles/:id/delete' do 
    Model.delete(params[:id])
    redirect_to :index 
  end 
end
