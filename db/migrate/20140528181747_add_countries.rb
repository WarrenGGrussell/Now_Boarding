class AddCountries < ActiveRecord::Migration

  def self.up
    create_table :countries do |t|
      t.string :name, :code, :null => false
      t.timestamps
    end
    load_data :countries
  end

  def self.down
    drop_table :countries
  end
end