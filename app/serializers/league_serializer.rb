class LeagueSerializer < ActiveModel::Serializer
  has_many :teams, serializer: TeamSerializer, include_nested_associations: true
  has_many :users
  attributes :id, :name, :closed, :creator_id

  # def teams
  #   unshuffledTeams = self.object.teams.map do |team|
  #   {
  #   id: team.id,
  #   name: team.name,
  #   user: team.user,
  #   points: team.points,
  #   wrestlers: team.wrestlers
  #   }
  #   end
  #   unshuffledTeams.shuffle
  # end

  
end
