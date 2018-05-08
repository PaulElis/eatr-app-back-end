class CreateBusinesses < ActiveRecord::Migration[5.1]
  def change
    create_table :businesses do |t|
      t.string :yelp_id
      t.string :name
      t.string :cuisine
      t.string :price
      t.float :rating
      t.string :address
      t.string :city
      t.string :state
      t.string :zip_code
      t.float :lat
      t.float :long
      t.integer :review_count
      t.string :url
      t.string :image

      t.timestamps
    end
  end
end
