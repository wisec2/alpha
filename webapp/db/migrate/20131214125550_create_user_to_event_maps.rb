class CreateUserToEventMaps < ActiveRecord::Migration
  def change
    create_table :user_to_event_maps do |t|
      t.integer :uid
      t.integer :eid
      t.timestamps
    end
  end
end
