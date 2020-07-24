class Records < ActiveRecord::Migration[6.0]
  def change
    create_table :records do |t|
      t.string :tournament
      t.integer :wins
      t.integer :losses
      t.belongs_to :wrestler
    end
  end
end
