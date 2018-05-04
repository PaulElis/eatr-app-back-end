class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :image_url
      t.string :favorites

      t.timestamps
    end
  end
end
