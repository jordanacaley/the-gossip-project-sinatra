require 'gossip'

class ApplicationController < Sinatra::Base
  get '/' do
    erb :index
  end

  get '/gossips/new/' do
    erb :new_gossip
  end

  post '/gossips/new/' do
    Gossip.new(params["gossip_author"], params["gossip_content"]).save
  end

  # post '/gossips/new/' do
  #   puts "Hi, I'm the server"
  #   puts "This is the content of the params hash: #{params}"
  #   puts "Cool! And this is what the user entered for gossip_author: #{params["gossip_author"]}"
  #   puts "Awesome, and this is waht the user entered in the gossip_content field: #{params["gossip_content"]}"
  #   puts "That's bomb.com. I'm out!"
  # end

end