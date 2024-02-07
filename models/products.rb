require './database/connection'

class Products < ActiveRecord::Base

  validates :name, presence: {message: 'O nome não pode estar em branco'}
  validates :description, presence: { message: "A descrição não pode estar em branco" }
  validates :price, presence:  { message: "O preço não pode estar em branco" }, numericality: { greater_than_or_equal_to: 0, message: "O preço deve ser maior ou igual a zero" }
  validates :quantity, presence: { message: "A quantidade não pode estar em branco" }, numericality: { only_integer: true, greater_than_or_equal_to: 0, message: "A quantidade deve ser um número inteiro maior ou igual a zero" }


  def store_product(data)
    begin
      self.attributes = data
      save!
    rescue ActiveRecord::RecordInvalid => e
      raise ArgumentError, e.message
    end
  end
end
