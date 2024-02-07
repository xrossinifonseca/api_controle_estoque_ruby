require './models/products'

class ProductsController

  def initialize
    @productsModel = Products.new
  end


  def create(data)
    # begin
    @productsModel.store_product(data)

      {success:true,message:"produto cadastrado com sucesso!",status:201}

  #   rescue ArgumentError => e

  #   raise ArgumentError, e.message
  # end

  end

end
