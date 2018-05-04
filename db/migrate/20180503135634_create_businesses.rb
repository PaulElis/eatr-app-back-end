class CreateBusinesses < ActiveRecord::Migration[5.1]
  def change
    create_table :businesses do |t|
      t.integer :yelp_id
      t.string :name
      t.string :cuisine
      t.integer :price
      t.integer :rating
      t.string :address
      t.string :image

      t.timestamps
    end
  end
end
