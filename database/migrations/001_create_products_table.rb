
require_relative '../connection'

class CreateProducts < ActiveRecord::Migration[7.1]
  def change


    begin
    create_table :products, if_not_exists: true do |t|
      t.string :name, null: false
      t.string :description, null: false
      t.float :price, null: false
      t.integer :quantity, null: false
      t.timestamps
    end

    p 'Tabela products criada com sucesso!'

  rescue =>e
    p "Falha ao criar Products"
    p e
    end


  end
end


CreateProducts.new.change
