class League < ApplicationRecord
  has_and_belongs_to_many :users
  has_many :teams
  validates :name, uniqueness: true

  def self.user_leagues(user_id)
    current_user = User.find_by(id: user_id)
    current_user.leagues
  end

  

end
