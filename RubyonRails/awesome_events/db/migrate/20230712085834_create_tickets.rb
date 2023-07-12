class CreateTickets < ActiveRecord::Migration[7.0]
  def change
    create_table :tickets do |t|
      t.references :user
      t.references :event, null: false, foreign_key: true, index: false
      t.string :comment

      t.timestamps
    end
    
    add_index :tickets, %i[event_id user_id], unique: true
  end
end
