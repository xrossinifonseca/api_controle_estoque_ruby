require_relative '../connection'

class CreateMovements < ActiveRecord::Migration[7.1]


  def change

    begin
    create_table :movements, if_not_exists: true do |t|
      t.bigint :product_id, null: false
      t.string :movement_type, null: false
      t.integer :quantity, null: false
      t.timestamps
    end

    add_foreign_key :movements, :products, column: :product_id

    p "Tabela movements criada com sucesso!"

  rescue =>e
    p "Falha ao criar Tabela movements"
    p e
    end
  end
end

CreateMovements.new.change
