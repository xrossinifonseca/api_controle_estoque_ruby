require './connection'




class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products, if_not_exists: true do |t|
      t.string :name, null: false
      t.string :description, null: false
      t.float :price, null: false
      t.integer :quantity, null: false
      t.timestamps
    end
  end
end

class CreateMovements < ActiveRecord::Migration[7.1]
  def change
    create_table :movements, if_not_exists: true do |t|
      t.bigint :product_id, null: false
      t.string :movement_type, null: false
      t.integer :quantity, null: false
      t.timestamps
    end

    add_foreign_key :movements, :products, column: :product_id
  end
end

CreateProducts.new.change

CreateMovements.new.change
