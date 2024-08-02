class CreateEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :events do |t|
      t.string :title
      t.datetime :date
      t.string :location
      t.string :description
      t.timestamps
      t.belongs_to :user, null: false, foreign_key: true
    end
  end
end
