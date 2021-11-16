class CreateEntries < ActiveRecord::Migration[6.1]
  def change
    create_table :entries do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.integer :entry_type
      t.date :entry_date
      t.time :entry_time

      t.timestamps
    end
  end
end
