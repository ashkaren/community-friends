class AddPointToUser < ActiveRecord::Migration
  def change
    add_column :users, :point, :decimal
  end
end
