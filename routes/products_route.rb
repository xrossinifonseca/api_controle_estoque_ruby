
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
    begin
    all =  ProductsController.new.find_all
    all.to_json

    rescue => e
      handle_error(400,e.message)
    end
  end



  get '/products/:id' do

    begin
    product = ProductsController.new.show(params[:id])
    product.to_json

  rescue ArgumentError => e
    handle_error(404, e.message)
  rescue StandardError => e
    handle_error(500, "Erro interno no servidor: #{e.message}")
  end
  end

  error do
    handle_error(500, 'Erro interno no servidor')
  end

  private

  def handle_error(status, message)
    status status
    { success: false, message: message, status: status }.to_json
  end

  private
end
