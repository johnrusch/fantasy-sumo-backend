class WrestlerMatches < ActiveRecord::Migration[6.0]
  def change
    create_join_table :wrestlers, :matches
  end
end
