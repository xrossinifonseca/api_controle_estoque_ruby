
require 'sinatra'
require 'json'
require'./controllers/products_controller'



class ProductsRoutes < Sinatra::Base

  configure do
    set :show_exceptions, false
  end

  before do
    content_type :json
  end

  post '/products/create' do
    body = JSON.parse(request.body.read)

    begin
      ProductsController.new.create(body).to_json
    rescue ArgumentError => e
      handle_error(400, e.message)
    rescue StandardError => e
      handle_error(500, "Erro interno no servidor: #{e.message}")
    end
  end


  get '/products/all' do
    all =  ProductsController.new.find_all
    all.to_json
  end

  not_found do
    handle_error(404, 'Rota não encontrada')
  end

  error do
    handle_error(500, 'Erro interno no servidor')
  end

  private

  def handle_error(status, message)
    status status
    { success: false, message: message, status: status }.to_json
  end

end
