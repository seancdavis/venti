class CreateServers < ActiveRecord::Migration
  def change
    create_table :servers do |t|
      t.string :host
      t.string :host_name
      t.string :user
      t.string :port
      t.integer :account_id

      t.timestamps
    end
  end
end
