class AddViewToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :view, :string
  end
end
