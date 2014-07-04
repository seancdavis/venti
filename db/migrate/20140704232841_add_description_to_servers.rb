class AddDescriptionToServers < ActiveRecord::Migration
  def change
    add_column :servers, :description, :string
  end
end
