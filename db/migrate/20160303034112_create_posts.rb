class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :description
      t.string :image_url
      t.time :time

      t.timestamps null: false
    end
  end
end
