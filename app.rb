require 'sinatra'
require 'sinatra/namespace'
require 'json'
require 'dotenv/load'

require_relative './controllers/product.controller'

set :port, ENV['SERVER_PORT']

products_controller = ProductsController.new

get "/" do

  "hello world".to_json

end


namespace '/api/v1' do

  before do
    content_type 'application/json'
  end


  get '/products' do
    "todos os produtos".to_json
  end

end
