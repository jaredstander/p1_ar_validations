class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :organizer_name, :organizer_email, :event_name
      t.date :event_date
      t.timestamps
    end
  end
end
