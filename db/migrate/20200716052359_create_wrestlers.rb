class CreateWrestlers < ActiveRecord::Migration[6.0]
  def change
    create_table :wrestlers do |t|
      t.string :name
      t.integer :age
      t.string :img
      t.string :current_rank
      t.string :highest_rank
      t.string :division
      t.integer :current_wins
      t.integer :current_losses
      t.integer :yusho
      t.integer :shukun_sho
      t.integer :kanto_sho
      t.integer :gino_sho
      t.integer :kinboshi
      t.string :heya
      t.integer :height
      t.integer :weight
      t.boolean :active

      t.timestamps
    end
  end
end
