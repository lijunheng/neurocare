class CreateRegistrations < ActiveRecord::Migration
  def change
    create_table :registrations do |t|
      t.integer :signed_up_user_id
      t.integer :signed_up_event_id

      t.timestamps
    end
    add_index :registrations, :signed_up_user_id
    add_index :registrations, :signed_up_event_id
    add_index :registrations, [:signed_up_user_id, :signed_up_event_id], unique: true, :name => 'registration_index'
  end
end
