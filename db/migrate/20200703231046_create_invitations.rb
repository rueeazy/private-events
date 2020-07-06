class CreateInvitations < ActiveRecord::Migration[6.0]
  def change
    create_table :invitations do |t|
      t.integer :attended_event_id
      t.integer :attendee_id

      t.timestamps
    end

    add_foreign_key :invitations,
                    :users,
                    column: :attendee_id
    add_index :invitations, :attendee_id

    add_foreign_key :invitations,
                    :events,
                    column: :attended_event_id
    add_index :invitations, :attended_event_id
  end
end
