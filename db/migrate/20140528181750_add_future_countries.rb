class FutureCountries < ActiveRecord::Migration
  def change
    add_column :country_id, :user_id, :reference
  end
end