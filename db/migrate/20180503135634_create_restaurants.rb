class CreateRestaurants < ActiveRecord::Migration[5.1]
  def change
    create_table :restaurants do |t|
      t.integer :rest_id
      t.string :name
      t.string :cuisine
      t.string :address
      t.integer :average_cost
      t.string :image

      t.timestamps
    end
  end
end
