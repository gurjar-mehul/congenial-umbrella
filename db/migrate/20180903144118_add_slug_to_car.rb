class AddSlugToCar < ActiveRecord::Migration[5.1]
  def change
    add_column :cars, :slug, :string
    add_index :cars, :slug
  end
end
