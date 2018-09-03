class CreateTracks < ActiveRecord::Migration[5.1]
  def change
    create_table :tracks do |t|
      t.string :country
      t.string :name
      t.string :timezone
      t.string :surface_type

      t.timestamps
    end
  end
end
