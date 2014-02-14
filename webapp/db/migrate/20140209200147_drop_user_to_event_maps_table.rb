class DropUserToEventMapsTable < ActiveRecord::Migration
  def up
    drop_table :user_to_event_maps
  end

  def down
    create_table "user_to_event_maps", force: true do |t|
      t.integer "uid"
      t.integer "eid"
      t.datetime "created_at"
      t.datetime "updated_at"
    end
  end
  
end
