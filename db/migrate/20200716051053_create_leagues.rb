class CreateLeagues < ActiveRecord::Migration[6.0]
  def change
    create_table :leagues do |t|
      t.string :name
      t.boolean :closed
      t.integer :creator_id
      t.string :passphrase

      t.timestamps
    end
  end
end
