class CreateStatistics < ActiveRecord::Migration
  def change
    create_table :statistics do |t|
      t.string :name
      t.integer :level
      t.date :created_at, null: false
    end
  end
  
  def self.down
    drop_table :statistics
  end
end