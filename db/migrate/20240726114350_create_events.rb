class CreateEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :events do |t|
      t.string :title
      t.datetime :date
      t.string :location
      t.string :description
      t.timestamps

      t.references :creator, foreign_key: { to_table: :users }
    end
  end
end
