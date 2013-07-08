class DropProductsTable < ActiveRecord::Migration
  def change
    drop_table :ads
  end
end
