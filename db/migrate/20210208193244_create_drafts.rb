class CreateDrafts < ActiveRecord::Migration[6.0]
  def change
    create_table :drafts do |t|
      t.references :league, null: false, foreign_key: true

      t.timestamps
    end
  end
end
