class LeagueSerializer < ActiveModel::Serializer
  attributes :id, :name, :teams

  def teams
    self.object.teams.map do |team|
      {name: team.name,
      user: team.user,
      points: team.points
      }
    end
  end
end
