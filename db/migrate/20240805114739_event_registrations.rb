class EventRegistrations < ActiveRecord::Migration[7.1]
  def change
    drop_table :registrations

    create_table :event_registrations do |t|
      t.references :user, foreign_key: true
      t.references :event, foreign_key: true
      t.timestamps
    end
  end
end
