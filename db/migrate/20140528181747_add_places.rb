class AddPlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :country
      t.boolean :visited
      t.references :user
      t.timestamps
    end
  end
end
