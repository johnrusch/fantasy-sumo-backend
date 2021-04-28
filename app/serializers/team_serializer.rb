class TeamSerializer < ActiveModel::Serializer
  belongs_to :user
  belongs_to :league
  has_many :wrestlers, serializer: WrestlerSerializer
  attributes :id, :name, :points

  def rank(current_rank)
    case current_rank
    when "Y"
      return "Yokozuna"
    when "O"
      return "Ozeki"
    when "S"
      return "Sekiwake"
    when "K"
      return "Komusubi"
    else
      return "Maegashira #{current_rank.to_i}"
    end
  end

  # def wrestlers
  #   self.object.wrestlers.map do |wrestler|
  #     {
  #     id: wrestler.id,
  #     name: wrestler.name,
  #     img: wrestler.img,
  #     currentRank: rank(wrestler.current_rank)
  #     }
  #   end
  # end


end
