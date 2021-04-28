class CreateDrafts < ActiveRecord::Migration[6.0]
  def change
    create_table :drafts do |t|
      t.belongs_to :league, null: false, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
