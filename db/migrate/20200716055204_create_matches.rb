class CreateMatches < ActiveRecord::Migration[6.0]
  def change
    create_table :matches do |t|
      t.string :day
      t.string :kimarite
      t.string :winner
      t.integer :points
      t.timestamps
    end
  end
end
