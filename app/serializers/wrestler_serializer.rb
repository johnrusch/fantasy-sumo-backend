class WrestlerSerializer < ActiveModel::Serializer
  attributes :id, :name, :age, :img, :currentRank, :yusho, :kinboshi, :heya, :height, :weight, :division
  
  attribute :current_wins, key: :currentWins
  attribute :current_losses, key: :currentLosses
  attribute :highest_rank, key: :highestRank
  attribute :shukun_sho, key: :shukunSho
  attribute :kanto_sho, key: :kantoSho
  attribute :gino_sho, key: :ginoSho

  yokozuna = Wrestler.yokozuna
  ozeki = Wrestler.ozeki
  sekiwake = Wrestler.sekiwake
  komusubi = Wrestler.komusubi
  maegashira = Wrestler.maegashira

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

  def currentRank
    rank(self.object.current_rank)
  end

end
