require "sinatra/base"
require "sinatra/json"
require 'httparty'

require_relative "base"

class App < Base
  get "/random" do
    json :message => HTTParty.get('https://dog.ceo/api/breeds/image/random')
  end

  get "/breeds" do
    json :message => HTTParty.get('https://dog.ceo/api/breeds/list/all')
  end

# Return json of a random dog of a specific breed

  get "/random_breed" do
    if params.has_key?('breed')
        json :message => HTTParty.get("https://dog.ceo/api/breed/#{params['breed']}/images/random")
    end
  end


end
