class CreatePackages < ActiveRecord::Migration[5.0]
  def change
    create_table :packages do |t|
      t.integer :size
      t.float :price
      t.integer :product_id

      t.timestamps
    end
  end
end
