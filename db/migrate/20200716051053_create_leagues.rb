class CreateLeagues < ActiveRecord::Migration[6.0]
  def change
    create_table :leagues do |t|
      t.string :name
      t.integer :number_of_teams
      t.boolean :closed
      t.integer :creator_id
      t.string :password_digest

      t.timestamps
    end
  end
end
