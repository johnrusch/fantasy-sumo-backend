class LeagueSerializer < ActiveModel::Serializer
  has_many :teams, serializer: TeamSerializer, include_nested_associations: true
  attributes :id, :name, :closed, :creator_id

  # def teams
  #   self.object.teams.map do |team|
  #     {
  #     id: team.id,
  #     name: team.name,
  #     user: team.user,
  #     points: team.points,
  #     wrestlers: team.wrestlers
  #     }
  #   end


  # end

  
end
