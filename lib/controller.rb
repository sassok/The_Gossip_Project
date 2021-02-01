require 'Gossip'
class ApplicationController < Sinatra::Base

  #Page d'accueil, affiche tous les Gossips
  get '/' do
    erb :index, locals: {gossips: Gossip.all}
  end

  get '/gossips/new/' do 
    erb :new_gossip
  end

  #Créer un nouveau Gossip et le sauvegarde
  post '/gossips/new/' do
    Gossip.new(params["gossip_author"], params["gossip_content"]).save
    redirect '/'
  end

  get '/gossips/:id/' do
    erb :show, locals: {id: Gossip.find(params['id'])}
  end

  #get 'gossips/:id/edit/' do
    #erb :edit
  #end

    
end
  

