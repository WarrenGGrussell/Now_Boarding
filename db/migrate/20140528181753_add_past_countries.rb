class AddPastCountries < ActiveRecord::Migration
  def change
    create_table :past_countries do |t|
      t.belongs_to :country
      t.belongs_to :user
    end
  end
end