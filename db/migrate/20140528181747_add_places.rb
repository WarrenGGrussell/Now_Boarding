class AddPlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :country
      t.timestamps
    end
  end
end
