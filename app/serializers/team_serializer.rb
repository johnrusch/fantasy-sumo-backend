class TeamSerializer < ActiveModel::Serializer
  attributes :id, :name, :league, :wrestlers

  def wrestlers
    self.object.wrestlers.map do |wrestler|
      {
      name: wrestler.name,
      img: wrestler.img,
      currentRank: wrestler.current_rank
      }
    end
  end

end
