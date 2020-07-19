class CreateTeams < ActiveRecord::Migration[6.0]
  def change
    create_table :teams do |t|
      t.string :name
      t.integer :points
      t.belongs_to :user
      t.belongs_to :league
      t.timestamps
    end
  end
end