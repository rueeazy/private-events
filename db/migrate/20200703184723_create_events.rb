class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.datetime :date
      t.integer :creator_id

      t.timestamps
    end

    add_foreign_key :events,
                    :users,
                    column: :creator_id
    add_index :events, :creator_id
  end
end
