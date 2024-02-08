require './models/products'

class ProductsController

  def create(data)
      Products.store(data)
      {success:true,message:"produto cadastrado com sucesso!",status:201}
    end

  def find_all
    Products.all
  end

  def show(id)

    product = Products.find_by(id: id)
    if product.nil?
      raise ArgumentError, "Produto não encontrado"
    end

    product

  end

end
