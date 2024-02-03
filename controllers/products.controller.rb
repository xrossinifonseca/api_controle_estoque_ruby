require '../models/products'

class ProductsController

  def initialize
    @productsModel = Products.new
  end


  def store(data)
    begin
      @productsModel.store_product(data)

      p 'Produto cadastrado com sucesso!'

    rescue ArgumentError => e

      puts e.message
    end
  end

end
