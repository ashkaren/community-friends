class AddViewToEvents < ActiveRecord::Migration
  def change
    add_column :events, :view, :string
  end
end
