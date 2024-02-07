require './models/products'

class ProductsController

  def create(data)
      Products.store(data)
      {success:true,message:"produto cadastrado com sucesso!",status:201}
    end

  def find_all
    Products.all
  end

end
