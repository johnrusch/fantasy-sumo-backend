class WrestlerTeams < ActiveRecord::Migration[6.0]
  def change
    create_join_table :wrestlers, :teams
  end
end
