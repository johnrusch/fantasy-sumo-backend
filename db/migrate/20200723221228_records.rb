class Records < ActiveRecord::Migration[6.0]
  def change
    create_table :records do |t|
      t.string :tournament
      t.integer :wins, :default => 0
      t.integer :losses, :default => 0
      t.belongs_to :wrestler
    end
  end
end
