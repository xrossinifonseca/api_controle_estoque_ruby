require 'dotenv/load'
require_relative 'routes/products_route'
require 'sinatra/namespace'


class Server < Sinatra::Base

  use ProductsRoutes

  configure do
    set :port, ENV['SERVER_PORT']
  end

  not_found do
    status 404
    { error: 'Rota não encontrada' }.to_json
  end

  run! if app_file == $0
end
